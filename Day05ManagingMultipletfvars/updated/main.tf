    terraform {
    required_providers {
        azurerm = {
        version = "3.81.0"
        source  = "hashicorp/azurerm"
        }
    }
    }

    provider "azurerm" {
    skip_provider_registration = true
    features {}
    }

    # Data source for the existing resource group
    data "azurerm_resource_group" "hubrg01" {
    name = var.rg_name
    }

    # Create a virtual network if not already present
    resource "azurerm_virtual_network" "vnet" {
    name                = var.hubnet
    address_space       = ["10.0.0.0/16"]
    location            = data.azurerm_resource_group.hubrg01.location
    resource_group_name = data.azurerm_resource_group.hubrg01.name
    }

    # Create a subnet
    resource "azurerm_subnet" "subnet" {
    name                 = var.dcsub
    resource_group_name  = data.azurerm_resource_group.hubrg01.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.0.1.0/24"]
    }

    # Create a Network Security Group (NSG)
    resource "azurerm_network_security_group" "nsg" {
    name                = var.nsg
    location            = data.azurerm_resource_group.hubrg01.location
    resource_group_name = data.azurerm_resource_group.hubrg01.name
    }

    # Add a rule to the NSG to allow RDP traffic
    resource "azurerm_network_security_rule" "rdp_rule" {
    name                        = "AllowRDPInbound"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "3389"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.hubrg01.name
    network_security_group_name = azurerm_network_security_group.nsg.name
    }

    # Create Public IPs for the virtual machines
    resource "azurerm_public_ip" "pip" {
    count               = length(var.servers)
    name                = "${var.server_prefix}-${var.servers[count.index].server_name}-pip"  # Unique name with prefix
    resource_group_name = data.azurerm_resource_group.hubrg01.name
    location            = data.azurerm_resource_group.hubrg01.location
    allocation_method   = "Static"
    }

    # Create Network Interfaces for the virtual machines
    resource "azurerm_network_interface" "nic" {
    count               = length(var.servers)
    name                = "${var.server_prefix}-${var.servers[count.index].server_name}-nic"  # Unique name with prefix
    resource_group_name = data.azurerm_resource_group.hubrg01.name
    location            = data.azurerm_resource_group.hubrg01.location

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.pip[count.index].id
    }
    }

    # Create Windows Virtual Machines
    resource "azurerm_windows_virtual_machine" "vm" {
    count               = length(var.servers)
    name                = "${var.server_prefix}-${var.servers[count.index].server_name}"  # Unique name with prefix
    location            = data.azurerm_resource_group.hubrg01.location
    resource_group_name = data.azurerm_resource_group.hubrg01.name
    size                = var.servers[count.index].vm_size
    admin_username      = var.admin_username
    admin_password      = var.admin_password

    network_interface_ids = [
        azurerm_network_interface.nic[count.index].id,
    ]

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = var.servers[count.index].os_version
        version   = "latest"
    }
    }

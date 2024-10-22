terraform {
    required_providers {
        azurerm = {
            version = "3.81.0"  # You can specify the latest version here
            source  = "hashicorp/azurerm"
        }
    }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

# Using an existing resource group that was created outside of Terraform

data "azurerm_resource_group" "hubrg01" {
  name = var.rg_name
}

## creation of virtual Network

resource "azurerm_virtual_network" "dCref" {
  name = var.hubnet
  resource_group_name = data.azurerm_resource_group.hubrg01.name
  location = data.azurerm_resource_group.hubrg01.location
  address_space = [ "10.0.0.0/16" ]
  tags = {
    "Env"      : "centralhub"
    "Workload" : "domaincontroller"
  }
}

## subnet block

resource "azurerm_subnet" "dCsubnetref" {
  name = var.dcsub
  resource_group_name = data.azurerm_resource_group.hubrg01.name
  virtual_network_name = azurerm_virtual_network.dCref.name
  address_prefixes = [ "10.0.1.0/24" ]
}


##  Public iP code block

resource "azurerm_public_ip" "WPIP" {
  name = var.pip
  resource_group_name = data.azurerm_resource_group.hubrg01.name
  location = data.azurerm_resource_group.hubrg01.location
  allocation_method = "Static"
}

## NSG code block

resource "azurerm_network_security_group" "hubnsg" {
  name = var.nsg
  resource_group_name = data.azurerm_resource_group.hubrg01.name
  location = data.azurerm_resource_group.hubrg01.location
}

## NSG association to dcsubnet01

resource "azurerm_subnet_network_security_group_association" "nsgassoc" {
  subnet_id                 = azurerm_subnet.dCsubnetref.id
  network_security_group_id = azurerm_network_security_group.hubnsg.id
}

## NSG Rule collection

resource "azurerm_network_security_rule" "rdpruleref" {
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
  network_security_group_name = azurerm_network_security_group.hubnsg.name
}

## cretion of network interface card which will be attaching to VirtualMachine

resource "azurerm_network_interface" "nic01" {
  name = "dcnic01"
  resource_group_name = data.azurerm_resource_group.hubrg01.name
  location = data.azurerm_resource_group.hubrg01.location

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.dCsubnetref.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.WPIP.id
  }
}


## Windows Server Definiton

resource "azurerm_windows_virtual_machine" "winvm01" {
  name                = "WINDC01"
  location            = data.azurerm_resource_group.hubrg01.location
  resource_group_name = data.azurerm_resource_group.hubrg01.name
  size                = "Standard_DC2s_v2"
  admin_username      = "adminkala"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
  publisher = "MicrosoftWindowsServer"
  offer     = "WindowsServer"
  sku       = "2019-Datacenter-gensecond"
  version   = "latest"
  }
}

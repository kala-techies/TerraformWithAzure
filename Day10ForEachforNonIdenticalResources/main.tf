  terraform {
      required_providers {
          azurerm={
              version                 = "4.6.0"
              source                  = "hashicorp/azurerm"
          }
      }
      backend "azurerm" {
        resource_group_name           = "kala-techies"
        storage_account_name          = "kalastrg01"
        container_name                = "terraformcontainer"
        access_key                    = "provide storage account access key here"
        key                           = "eenv.terraform.tfstate"
      }
  }

  provider "azurerm" {
    features {}
  }

  ## resouece group block
  resource "azurerm_resource_group" "rgref" {
    for_each                          = var.Resourcedetails
    name                              = each.value.rg_name
    location                          = each.value.rg_location
  }

  ## virtual networks bloc
  resource "azurerm_virtual_network" "vnetref" {
    for_each                          = var.Resourcedetails
    name                              = each.value.vnetname
    resource_group_name               = azurerm_resource_group.rgref[each.key].name
    location                          = azurerm_resource_group.rgref[each.key].location
    address_space                     = each.value.addressspace
  }

  ## subnet block
  resource "azurerm_subnet" "subnetref" {
    for_each                          = var.Resourcedetails
    name = each.value.subnetname
    virtual_network_name              = azurerm_virtual_network.vnetref[each.key].name
    resource_group_name               = azurerm_resource_group.rgref[each.key].name
    address_prefixes                  = each.value.addressprefix
  }

  ## network interface block
  resource "azurerm_network_interface" "nicref" {
    for_each = var.Resourcedetails
    name                              = "nic"
    location                          = azurerm_resource_group.rgref[each.key].location
    resource_group_name               = azurerm_resource_group.rgref[each.key].name

    ip_configuration {
      name                            = "internal"
      subnet_id                       = azurerm_subnet.subnetref[each.key].id
      private_ip_address_allocation   = "Dynamic"
    }
  }

  #3 virtual machine definition

  resource "azurerm_virtual_machine" "vm" {
    for_each = var.Resourcedetails

    name                              = each.value.vm_name
    location                          = azurerm_resource_group.rgref[each.key].location
    resource_group_name               = azurerm_resource_group.rgref[each.key].name
    network_interface_ids             = [azurerm_network_interface.nicref[each.key].id]
    vm_size                           = each.value.vm_size

    storage_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "16.04-LTS"
      version   = "latest"
    }

    storage_os_disk {
      name                           = "${each.value.vm_name}-osdisk"
      caching                        = "ReadWrite"
      create_option                  = "FromImage"
      managed_disk_type              = "Standard_LRS"
    }

    os_profile {
      computer_name                  = each.value.vm_name
      admin_username                 = "adminuser"
      admin_password                 = "Password1234!"
    }

    os_profile_linux_config {
      disable_password_authentication = false
    }
  }
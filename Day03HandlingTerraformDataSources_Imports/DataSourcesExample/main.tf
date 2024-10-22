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

# Using an existing virtual network from the portal, without storing any related data in the Terraform state file

data "azurerm_virtual_network" "existing_vnet" {
  name                = var.hubnet
  resource_group_name = data.azurerm_resource_group.hubrg01.name
}

# Deploying a subnet inside the existing virtual network

resource "azurerm_subnet" "hubsubnetref" {
  name                 = "hubsubnet01"
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = data.azurerm_resource_group.hubrg01.name
}

# Explanation:
# When you destroy this infrastructure, Terraform will only destroy the subnet (azurerm_subnet.hubsubnetref).
# It will not affect the existing resource group or virtual network, because those were referenced using data blocks.
# The data blocks are read-only, meaning they don't modify or store these resources in the Terraform state file like an import would.

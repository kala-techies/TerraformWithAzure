terraform {
    required_providers {
        azurerm={
            version = "3.81.0" ## you can mention lastest version 
            source = "hashicorp/azurerm"
        }
    }
}


provider "azurerm" {
  skip_provider_registration = true
  features {}
}


## cration of azure resource group 

resource "azurerm_resource_group" "hub" {
  name = var.rg_name
  location = var.rg_loc
}

## creation of azure virtual network
resource "azurerm_virtual_network" "hubnet" {
  name = var.hubnet
  resource_group_name = azurerm_resource_group.hub.name
  location = azurerm_resource_group.hub.location
  address_space = [ "10.0.0.0/16" ]
  tags = {
    "env": "central"
  }
  }


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



resource "azurerm_resource_group" "hub" {
  name = var.rg_name
  location = var.rg_loc
}
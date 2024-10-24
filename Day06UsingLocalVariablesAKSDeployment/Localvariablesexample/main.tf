terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "83804c39-5b72-4f70-b7a0-26a3671d4294"
  features {}
}

## locals 
locals {
  rgref = data.azurerm_resource_group.rgacr
}

## existing resource group
data "azurerm_resource_group" "rgacr" {
  name = var.rgname
}

## container registry 
resource "azurerm_container_registry" "acr" {
  name                = var.acrname
  resource_group_name = local.rgref.name
  location            = local.rgref.location
  sku                 = "Premium"
  admin_enabled       = true
}

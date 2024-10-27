    # Required providers block
    terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.6.0"
        }
    }
    }

    # Configure the Azure provider
    provider "azurerm" {
    subscription_id = "xxxxxxxxxxxxx"
    features {}
    }

## resouece group definition

data "azurerm_resource_group" "countrgref" {
    name = var.rgname
}

    # Virtual network definition
    resource "azurerm_virtual_network" "hubnetref" {
    name                   = var.hubnet
    address_space          = [var.hubspace]
    location               = data.azurerm_resource_group.countrgref.location
    resource_group_name    = data.azurerm_resource_group.countrgref.name
    }

## subnet names 
resource "azurerm_subnet" "subentref" {
    count                   = length(var.subnets)  ## here we can also write as 2.
    name                    = var.subnets[count.index]
    resource_group_name     = data.azurerm_resource_group.countrgref.name
    virtual_network_name    = azurerm_virtual_network.hubnetref.name
    address_prefixes        = [var.subnetspace[count.index]]
}
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
    subscription_id = "xxxxxxxxxxxxxx" 
    features {}
    }

    # Data resource to reference an existing resource group
    data "azurerm_resource_group" "countrgref" {
    name = var.rgname
    }

    # Virtual network definition with lifecycle to ignore changes in address space
    resource "azurerm_virtual_network" "hubnetref" {
    name                = var.hubnet
    address_space       = [var.hubspace]
    location            = data.azurerm_resource_group.countrgref.location
    resource_group_name = data.azurerm_resource_group.countrgref.name

    # Lifecycle block to ignore changes in the address_space
    lifecycle {
        ignore_changes = [address_space]
        # This prevents re-application if only address space changes are made
    }
    }

    # Subnet definitions with lifecycle to create before destroy
    resource "azurerm_subnet" "subentref" {
    count                 = length(var.subnets)  # Defines how many subnets to create based on the list length
    name                  = var.subnets[count.index]
    resource_group_name   = data.azurerm_resource_group.countrgref.name
    virtual_network_name  = azurerm_virtual_network.hubnetref.name
    address_prefixes      = [var.subnetspace[count.index]]

    # Lifecycle block to create a new subnet before destroying the old one
    lifecycle {
        create_before_destroy = true
        # This ensures minimal downtime by creating the replacement subnet before destroying the current one
    }
    }

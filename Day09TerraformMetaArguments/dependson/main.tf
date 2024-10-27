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

    # Resource group definition
    resource "azurerm_resource_group" "myrgref" {
    name     = "kala-techies"
    location = "East US"
    }

    # Virtual network definition
    resource "azurerm_virtual_network" "hubnetref" {
    name                = "hubnetwork"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.myrgref.location
    resource_group_name = azurerm_resource_group.myrgref.name
    }

    # Subnet 1 definition with depends_on meta-argument
    resource "azurerm_subnet" "sub1ref" {
    name                 = "hubsubnet01"
    resource_group_name  = azurerm_resource_group.myrgref.name
    virtual_network_name = azurerm_virtual_network.hubnetref.name
    address_prefixes     = ["10.0.1.0/24"]

    # Explicit dependency on the virtual network
    depends_on = [azurerm_virtual_network.hubnetref]
    }

    # Subnet 2 definition with depends_on meta-argument
    resource "azurerm_subnet" "sub2ref" {
    name                 = "hubsubnet02"
    resource_group_name  = azurerm_resource_group.myrgref.name
    virtual_network_name = azurerm_virtual_network.hubnetref.name
    address_prefixes     = ["10.0.2.0/24"]

    # Explicit dependency on the virtual network
    depends_on = [azurerm_virtual_network.hubnetref]
    }

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "83804c39-5b72-4f70-b7a0-26a3671d4294"  ## mention your subcrription id here
  features {}
}


## existing resource group
data "azurerm_resource_group" "rgaks" {
     name = var.rgname
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = data.azurerm_resource_group.rgaks.location
  resource_group_name = data.azurerm_resource_group.rgaks.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
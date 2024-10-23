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

data "azurerm_resource_group" "testrg1" {
  name = "kala-techies"

}

resource "azurerm_storage_account" "storage" {
  for_each = var.storage_accounts

  name                     = each.key
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}



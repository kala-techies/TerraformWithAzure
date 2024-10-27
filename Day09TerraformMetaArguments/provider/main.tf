
    # The `azurerm` provider is used to interact with Microsoft Azure resources.
    terraform {
    required_providers {
        azurerm = {
        # Using the HashiCorp azurerm provider to manage Azure resources
        source = "hashicorp/azurerm"
        # Specifying the version of the azurerm provider for compatibility
        version = "4.6.0"
        }
    }
    }

    # Configuring the azurerm provider with basic settings
    provider "azurerm" {
    # The `features` block is required but can be left empty.
    # It allows you to configure provider-specific features.
    features {}
    }

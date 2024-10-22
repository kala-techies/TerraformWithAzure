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

# Creation of Azure resource group 
resource "azurerm_resource_group" "hub" {
  name     = var.rg_name
  location = var.rg_loc
}

# Creation of Azure virtual network
resource "azurerm_virtual_network" "hubnet" {
  name                = var.hubnet
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  address_space       = ["10.0.0.0/16"]
  tags = {
    env = "central"
  }
}

# Scenario: After creating the virtual network, you logged off. 
# Meanwhile, someone (onshore or a team member) manually created a subnet from the Azure portal due to project dependencies. 
# Workloads have already been deployed in this subnet. 

# In this case, to avoid conflicts, you can import the manually created subnet into Terraform.
# At this point, Terraform is unaware of the manually created subnet. 
# If you run 'terraform plan', Terraform will attempt to create a new subnet.

resource "azurerm_subnet" "hubsubnet01" {
  name                 = var.hubsubnet01
  resource_group_name  = azurerm_resource_group.hub.name
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.hubnet.id
}

# To import the manually created subnet into your Terraform state, use the following command:
# terraform import azurerm_subnet.hubsubnet01 /subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP_NAME>/providers/Microsoft.Network/virtualNetworks/<VNET_NAME>/subnets/<SUBNET_NAME>

# After a successful import, you will see the following message in the terminal:
# Import successful!
# The resources imported are now in your Terraform state and will be managed by Terraform going forward.

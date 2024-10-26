terraform {
    required_providers {
        azurerm={
            source = "hashicorp/azurerm"
            version = "4.6.0"
        }
    }
}


provider "azurerm" {
    subscription_id = "xxxxxxxxxxxxxxx"
    features {}
}

locals {
    rgname = data.azurerm_resource_group.aksref
}

## existing resource group definition

data "azurerm_resource_group" "aksref" {
    name = var.aksref
}

## cutome virtual network 

resource "azurerm_virtual_network" "aksvnetref" {
    name = var.aksvnet
    resource_group_name = local.rgname.name
    location = local.rgname.location
    address_space = [ "10.0.0.0/16" ]
}

## custome subnet 

resource "azurerm_subnet" "akssubnetref" {
    name = var.akssubent
    resource_group_name = local.rgname.name
    virtual_network_name = azurerm_virtual_network.aksvnetref.name
    address_prefixes = [ "10.0.0.0/22" ]
    
}

## azure container registery to store images

resource "azurerm_container_registry" "acrrf" {
    name = var.acrname
    resource_group_name = local.rgname.name
    location = local.rgname.location
    sku = "Premium"
    admin_enabled = true   ## set to be true in order to connect the acr
}

## aks deployment

resource "azurerm_kubernetes_cluster" "clusterref" {
    name                = var.clustername
    location            = data.azurerm_resource_group.aksref.location
    resource_group_name = data.azurerm_resource_group.aksref.name
    dns_prefix          = "prod-aks-eastus"

    # Default node pool with Linux OS and auto-scaling
    default_node_pool {
        name                = "linkala"
        vm_size             = "Standard_DC2ds_v3"                    ## Standard_DC2ds_v3 
        min_count           = 1                                      ## Minimum number of nodes
        max_count           = 5                                      ## Maximum number of nodes
        vnet_subnet_id      = azurerm_subnet.akssubnetref.id         ## existing vnet usage
        type                = "VirtualMachineScaleSets"
    }

     network_profile {
    network_plugin      = "azure"      # Specifies the Azure CNI network plugin for networking
    network_policy      = "calico"     # Sets Calico as the network policy for better network security and control
    dns_service_ip      = "10.0.0.10"  # IP address for the Kubernetes DNS service within the cluster
    service_cidr        = "10.0.0.0/16" # IP range for Kubernetes services within the cluster
    load_balancer_sku   = "standard"   # Configures the load balancer SKU to "standard" for high availability and scaling
}


    identity {
        type = "SystemAssigned"
    }

    depends_on = [ azurerm_container_registry.acrrf, azurerm_virtual_network.aksvnetref, azurerm_subnet.akssubnetref ]

    tags = {
        Environment = "Production"
    }
}


    resource "azurerm_role_assignment" "aks2acr" {
    #principal_id                     = azurerm_kubernetes_cluster.example.kubelet_identity[0].object_id
    principal_id                     = azurerm_kubernetes_cluster.clusterref.kubelet_identity[0].object_id
    role_definition_name             = "AcrPull"
    scope                            = azurerm_container_registry.acrrf.id
    skip_service_principal_aad_check = true
}
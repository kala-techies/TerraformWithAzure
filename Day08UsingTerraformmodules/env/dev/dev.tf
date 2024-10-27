terraform {
    required_providers {
        azurerm={
            source = "hashicorp/azurerm"
            version = "4.6.0"
        }
    }
}


provider "azurerm" {
    subscription_id = "#######"  
    features {}
}


## dev environment actual value details 

module "dev" {
    source = "../../modules"
    apprg = "kala-techies01"
    appplanref = "devkalatechies01"
    winapp = "devwinkalatechies"
    applocation = "canadacentral"
}
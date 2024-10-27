terraform {
    required_providers {
        azurerm={
            source = "hashicorp/azurerm"
            version = "4.6.0"
        }
    }
}


provider "azurerm" {
    subscription_id = "#########"  
    features {}
}


## dev environment actual value details 

module "prod" {
    source = "../../modules"
    apprg = "uat-kala-techies01"
    appplanref = "uatkalatechies01"
    winapp = "uatwinkalatechies"
    applocation = "canadacentral"
}
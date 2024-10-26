variable "aksref" {
    type = string
    description = "refers to existing resource group"
}


## aks vnet name

variable "aksvnet" {
    type = string
    description = "our custome vent for azure kubernets services"
}


## aks subnet

variable "akssubent" {
    type = string
    description = "refers to aks subnet"
}

## acr name

variable "acrname" {
    type = string
    description = "refers to azure conrtainer registery name"
}

## aks name 

variable "clustername" {
    type = string
    description = "refers to kubernets clusted name"
}


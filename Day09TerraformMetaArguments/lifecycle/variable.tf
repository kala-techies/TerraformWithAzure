    ## resource group name for countrgref
    variable "rgname" {
    type        = string
    description = "Refers to existing resource group"
    }

    ## Virtual network name
    variable "hubnet" {
    type        = string
    description = "Refers to hub virtual network name"
    }

    ## Virtual network address space
    variable "hubspace" {
    type        = string
    description = "Refers to hubnetwork range"
    }

    ## Hub subnet names
    variable "subnets" {
    type        = list(string)
    description = "Refers to hub subnet names"
    }

    ## Subnet address prefix
    variable "subnetspace" {
    type        = list(string)
    description = "Refers to subnet space"
    }

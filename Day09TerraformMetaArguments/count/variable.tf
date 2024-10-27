## resource group name for countrgref

variable "rgname" {
    type = string
    description = "refers to existing resource group"
}

## virtual network name 

variable "hubnet" {
    type = string
    description = "refers to hub virtual netowrk name"
}


## virtual network adderess space

variable "hubspace" {
    type = string
    description = "refers to hubnetwork range"
}

##  hub subnet names

variable "subnets" {
    type = list(string)
    description = "refers to hub subnet names"
}       

## subnet address prefix

variable "subnetspace" {
    type = list(string)
    description = "refers to subnet space"
}
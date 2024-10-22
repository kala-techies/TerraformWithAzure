## Hub resource group name variable definition
variable "rg_name" {
    type = string
    description = "refers to resource group name"
}


## virtualnetwork name
variable "hubnet" {
    type = string
    description = "refers to hubnet name"
}

## subnet name
variable "dcsub" {
    type = string
    description = "refers to DC Subnet name"
}

## public IP
variable "pip" {
    type = string
    description = "refers to public IP of hub workloads"
}

## hubnsg
variable "nsg" {
    type = string
    description = "refers to nsg of hubsubnet workloads"
}
## Hub resource group name variable definition
variable "rg_name" {
    type = string
    description = "refers to resource group name"
}

## hub resource group location variable definition
variable "rg_loc" {
    type = string
    description = "refers to resource group location"
}

## virtualnetwork name

variable "hubnet" {
    type = string
    description = "refers to hubnet name"
}
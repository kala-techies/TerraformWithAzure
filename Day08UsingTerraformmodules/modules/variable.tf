variable "apprg" {
    type = string
    description = "refers to web app resource group"
}


## location of rg

variable "applocation" {
    type = string
    description = "refers to resource group location"
}

## service plan 

variable "appplanref" {
    type = string
    description = "refers to app servic name"
}

## windows app service

variable "winapp" {
    type = string
    description = "refers to windows web app name"
}
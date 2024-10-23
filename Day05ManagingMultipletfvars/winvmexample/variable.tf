# Resource group name
variable "rg_name" {
  type        = string
  description = "Resource group name"
}

# Virtual Network name
variable "hubnet" {
  type        = string
  description = "Virtual network name"
}

# Subnet name
variable "dcsub" {
  type        = string
  description = "Subnet name"
}

# NSG name
variable "nsg" {
  type        = string
  description = "NSG name"
}

# Admin credentials for the virtual machine
variable "admin_username" {
  type        = string
  description = "Administrator username for the virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Administrator password for the virtual machine"
}

# Prefix for deployment
variable "server_prefix" {
  type        = string
  description = "Prefix or unique identifier for this deployment"
}

# List of servers
variable "servers" {
  type = list(object({
    server_name = string
    vm_size     = string
    os_version  = string
  }))
}

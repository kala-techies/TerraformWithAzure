    variable "Resourcedetails" {
        type = map(object({
            rg_name                 = string 
            rg_location             = string
            vnetname                = string
            addressspace            = list(string)
            subnetname              = string
            addressprefix           = list(string)
            vm_name                 = string
            vm_size                 = string
        }))
    }




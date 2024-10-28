    Resourcedetails = {
    "Dcconfiguratio" = {
                rg_name                 = "dcrg01" 
                rg_location             = "east us"
                vnetname                = "dcvnet01"
                addressspace            = ["10.0.0.0/16"]
                subnetname              = "dcsubnet01"
                addressprefix           = ["10.0.1.0/24"]
                vm_name                 = "dcsvr01"
                vm_size                 = "Standard_B2s"
    }
    "Antivirusconfiguration" = {
                rg_name                 = "avrg01" 
                rg_name                 = "avrg01" 
                rg_location             = "central us"
                vnetname                = "avvnet01"
                addressspace            = ["172.16.0.0/16"]
                subnetname              = "avsubnet01"
                addressprefix           = ["172.16.1.0/24"]
                vm_name                 = "avsvr01"
            vm_size                     = "Standard_B2s"
    }
    }
rg_name         = "kala-techies"
hubnet          = "hubvnet01"
dcsub           = "dcsubnet01"
nsg             = "centralnsg01"
admin_username  = "adminkala"
admin_password  = "P@$$w0rd1234!"
server_prefix   = "winav"

servers = [
  {
    server_name = "01"
    vm_size     = "Standard_DC2s_v2"
    os_version  = "2019-Datacenter-gensecond"
  }
]

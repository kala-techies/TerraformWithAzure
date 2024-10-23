variable "storage_accounts" {
  description = "A map of storage account configurations."
  type = map(object({
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

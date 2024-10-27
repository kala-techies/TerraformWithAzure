## esisting resource group name

# data "azurerm_resource_group" "apprg" {
#     name = var.apprg
# }

## new resource group

resource "azurerm_resource_group" "apprg" {
  name = var.apprg
  location = var.applocation
}

resource "azurerm_service_plan" "appplanref" {
  name                = var.appplanref
  location            = azurerm_resource_group.apprg.location
  resource_group_name = azurerm_resource_group.apprg.name
  os_type             = "Windows"
  sku_name            = "F1"
}

## windows webapp

resource "azurerm_windows_web_app" "winwebapp" {
  name                = var.winapp
  location            = azurerm_resource_group.apprg.location
  resource_group_name = azurerm_resource_group.apprg.name
  service_plan_id     = azurerm_service_plan.appplanref.id

  site_config {
    application_stack {
      current_stack  = "java"
      java_version   = "11"
      tomcat_version = "9.0"    
    }

    always_on = false    ## set to be false when you are usin gree versions
  }
}



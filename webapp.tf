resource "azurerm_service_plan" "dev_plan" {
  name                = "dev-appservice-plan"
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "dev_webapp" {
  name                = var.webapp_name
  resource_group_name = azurerm_resource_group.dev_rg.name
  location            = azurerm_resource_group.dev_rg.location
  service_plan_id     = azurerm_service_plan.dev_plan.id

  site_config {
    always_on = true
  }

  app_settings = {
    "ENVIRONMENT" = "dev"
  }

  https_only = true
}

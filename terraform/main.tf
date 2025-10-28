provider "azurerm" {
  features {}
  subscription_id = "ffc118aa-e9e9-4473-b80a-403af88c517f"
}

resource "azurerm_resource_group" "portfolio_rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = "production"
    project     = "portfolio"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  location            = azurerm_resource_group.portfolio_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.portfolio_rg.location
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app_service" {
  name                = var.app_service_name
  location            = azurerm_resource_group.portfolio_rg.location
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_ENABLE_CI"                    = "true"
    "WEBSITES_PORT"                       = "80"
  }
}
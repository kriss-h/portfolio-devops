provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "portfolio_rg" {
  name     = "portfolio-rg"
  location = "East US"
}

resource "azurerm_container_registry" "portfolio_acr" {
  name                = "portfolioregistry123"
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  location            = azurerm_resource_group.portfolio_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_container_group" "portfolio_container" {
  name                = "portfolio-container"
  location            = azurerm_resource_group.portfolio_rg.location
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  os_type             = "Linux"

  container {
    name   = "portfolio"
    image  = "${azurerm_container_registry.portfolio_acr.login_server}/portfolio-devops:latest"
    cpu    = "0.5"
    memory = "1.0"
    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  ip_address_type = "Public"
  dns_name_label  = "portfolio-iac-demo"
}
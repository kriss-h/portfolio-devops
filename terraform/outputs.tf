output "resource_group_name" {
  value = azurerm_resource_group.portfolio_rg.name
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "app_service_url" {
  value = "https://${azurerm_linux_web_app.app_service.default_hostname}"
}

output "acr_admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "portfolio-aks"
  location            = azurerm_resource_group.portfolio_rg.location
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  dns_prefix          = "portfolio-aks"
  kubernetes_version  = "1.32.7" # ✅ Updated to a supported version in East US

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "production"
    project     = "portfolio"
  }
}

# ⚠️ Optional — this connects AKS to ACR (you can keep or remove it)
# If you're switching to Docker Hub, this can be safely removed.
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

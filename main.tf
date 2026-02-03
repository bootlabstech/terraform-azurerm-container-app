resource "azurerm_container_app_environment" "example" {
  name                       = "${var.name}-env"
  location                   = var.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
  resource_group_name        = var.resource_group_name
  public_network_access = var.public_network_access
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
    minimum_count         = 0
    maximum_count         = 10
  }
}
resource "azurerm_container_app" "example" {
  name                         = var.name
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          =  var.resource_group_name
  revision_mode                = var.revision_mode
  workload_profile_name        = "Consumption"
  template {
    container {
      name   = "${var.name}-cnt"
      image  = var.image
      cpu    = var.cpu
      memory = var.memory
    }
  }
  
}
resource "azurerm_log_analytics_workspace" "example" {
  name                = "${var.name}-logs"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
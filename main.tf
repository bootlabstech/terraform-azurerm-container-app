resource "azurerm_container_app_environment" "example" {
  name                       = "${var.name}-env"
  location                   = var.location
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id
  resource_group_name        = var.resource_group_name
  public_network_access = var.public_network_access
  workload_profile {
    name                  = "${var.name}-envprofile"
    workload_profile_type = var.env_workload_profile_type
    minimum_count         = 0
    maximum_count         = 10
  }
}
resource "azurerm_container_app" "example" {
  name                         = var.name
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          =  var.resource_group_name
  revision_mode                = var.revision_mode
  workload_profile_name        = "${var.name}-cappprofile"
  template {
    container {
      name   = "${var.name}-cnt"
      image  = var.image
      cpu    = var.cpu
      memory = var.memory
    }
  }
  
}
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = "${var.name}-log"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}


# Creates  a private endpoint with private dns
resource "azurerm_private_endpoint" "endpoint" {
  name                = "${var.name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = "${var.name}-connection"
    private_connection_resource_id = azurerm_container_app.example.id
    is_manual_connection           = var.is_manual_connection
    subresource_names              = var.subresource_names

  }
  private_dns_zone_group {
    name                 = "${var.name}-dnszone"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

}
resource "azurerm_container_group" "example"{
name = var.name
resource_group_name = var.resource_group_name
location = var.location
os_type = var.os_type
ip_address_type = var.ip_address_type
container {
name = var.container_name
image = var.image
cpu = var.cpu
memory = var.memory
 ports {
   port = var.port
   protocol = var.protocol
  }
 }
}
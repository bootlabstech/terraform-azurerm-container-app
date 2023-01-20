variable "name" {
  type        = string
  description = "name of the container app"
}
variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}
variable "location" {
  type        = string
  description = "location of the container app"
}
variable "os_type" {
  type        = string
  description = "os type of the container app"
}
variable "ip_address_type" {
  type        = string
  description = "ip_address type of the container app"
}
variable "container_name" {
  type        = string
  description = "name of the container app"
}
variable "image" {
  type        = string
  description = "image of the container app"
}
variable "cpu" {
  type        = number
  description = "cpu of the container"
}
variable "memory" {
  type        = number
  description = "memory of the container"
}
variable "port" {
  type        = number
  description = "port exposed of the container"
}
variable "protocol" {
  type        = string
  description = "protocol of the container"
}

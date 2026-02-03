variable "location" {
  type        = string
  description = "name of the container app"
}
variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}
variable "name" {
  type        = string
  description = "location of the container app"
}
variable "revision_mode" {
  type        = string
  description = "os type of the container app"
  default = "Single"
}
variable "image" {
  type        = string
  description = "ip_address type of the container app"
}
variable "cpu" {
  type        = string
  description = "name of the container app"
}
variable "memory" {
  type        = string
  description = "image of the container app"
}

variable "public_network_access" {
  type = string
  default = "Disabled"
  
}


# private endpoint


variable "private_endpoint_subnet_id" {
  type        = string
  description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint."

}
variable "private_connection_resource_id" {
  type        = string
  description = "The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to."

}
variable "is_manual_connection" {
  type        = bool
  description = "Does the Private Endpoint require Manual Approval from the remote resource owner?"
  default     = false

}
variable "subresource_names" {
  type        = list(string)
  default = [ "managedEnvironment" ]
  description = " A list of subresource names which the Private Endpoint is able to connect to."
}
variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
}

variable "ip_configuration" {
  type        = bool
  default     = false
  description = "One or more ip_configuration blocks as defined below. This allows a static IP address to be set for this Private Endpoint, otherwise an address is dynamically allocated from the Subnet."
}





variable "sku" {
  type        = string
  description = "Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018."
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  default     = 30
}

variable "env_workload_profile_type" {
  type = string
  default = "Consumption"
  
}

variable "minimum_count" {
  type = number
  default = 0
  
}
variable "maximum_count" {
  type = number
  default = 10
  
}
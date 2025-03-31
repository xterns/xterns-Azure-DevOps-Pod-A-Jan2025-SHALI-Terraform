variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_wan_name" {
  type = string
}

variable "virtual_wan_location" {
  type = string
}

variable "virtual_wan_type" {
  type    = string
  default = "Standard"
}

variable "vnet_attachments" {
  description = "Map of virtual networks to connect to the virtual hub"
  type = map(object({
    vnet_id                    = string
    internet_security_enabled = bool
  }))
}

variable "virtual_wan_route_tables" {
  type = list(object({
    name    = string
    labels  = optional(list(string), [])  # 👈 Makes it optional with a default empty list
    routes  = list(object({
      name                = string
      destinations        = list(string)
      destinations_type   = string
      next_hop            = string
      next_hop_type       = string
      next_hop_ip_address = string
    }))
  }))
}








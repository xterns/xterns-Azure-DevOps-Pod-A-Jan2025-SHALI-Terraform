variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "location" {
  description = "The Azure region where the VNet will be deployed"
  type        = string
}


variable "address_space" {
  description = "The address space for the VNet"
  type        = list(string)
}

variable "vnet_tags" {
  description = "Tags to assign to the VNet"
  type        = map(string)
}

variable "environment" {
  description = "Deployment environment (sandbox, staging, production)"
  type        = string
}

variable "virtual_wan_name" {
  description = "The name of the Virtual WAN"
  type        = string
}

variable "virtual_wan_location" {
  description = "The location of the Virtual WAN"
  type        = string
}

variable "virtual_wan_type" {
  description = "The type of the Virtual WAN"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
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



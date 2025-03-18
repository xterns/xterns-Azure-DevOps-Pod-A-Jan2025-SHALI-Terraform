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

variable "tags" {
  description = "Tags to assign to the VNet"
  type        = map(string)
}

variable "resource_group_name" {
  description = "The name of the existing Azure Resource Group"
  type        = string
}

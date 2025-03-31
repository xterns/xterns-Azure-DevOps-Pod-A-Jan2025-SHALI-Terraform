# Global Variables
variable "location" {
  description = "The Azure region where resources are deployed"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
}

# Module Variables
variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "The address space for the VNet"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment (sandbox, staging, production)"
  type        = string
}

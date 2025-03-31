variable "address_space" {
  description = "The address space for the VNet"
  type        = list(string)
}

variable "tags" {
  description = "Tags to assign to the VNet"
  type        = map(string)
}

variable "environment" {
  description = "Deployment environment (sandbox, staging, production)"
  type        = string
}

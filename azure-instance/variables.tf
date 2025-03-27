variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

variable "environment" {
  type        = string
  description = "Deployment environment (sandbox/staging/production)"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "instance_type" {
  type        = string
  description = "VM size/instance type"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the VM"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for VM access"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to apply to resources"
  default     = {}
}
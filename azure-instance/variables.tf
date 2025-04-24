variable "environment" {
  description = "Deployment environment (e.g., sandbox, staging, production)"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "instance_type" {
  description = "Size of the VM instance"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the VM will be placed"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for authentication"
  type        = string
}

variable "default_tags" {
  description = "Default tags for resources"
  type        = map(string)
  default     = {}
}

variable "image_name" {
  type = string
  description = "value for the image name"
}

variable "key_pair_name" {
  description = "Name of the SSH key pair"
  type        = string
}

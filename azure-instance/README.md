Terraform Module: Azure VM Provisioning with Packer-built Images

Overview

This Terraform module provisions an Azure Virtual Machine (VM) using dynamically retrieved Packer-built images. The module is designed to be reusable across multiple environments (sandbox, staging, production) and supports environment-specific configurations.

Features

Dynamic AMI Retrieval: Automatically fetches the latest Packer-built image.

Environment-Specific Configurations: Uses .tfvars for sandbox, staging, and production.

Flexible Deployment: Supports custom instance types, key pair names, security groups, and networking configurations.

Modular Design: Easily reusable for different Azure environments.

Architecture

Retrieve Latest AMI: Uses Terraform data sources to fetch the latest image.

Provision VM: Deploys a VM using the dynamically retrieved image.

Environment Support: Configurations are stored in .tfvars files for different environments.

Usage

1️⃣ Module Source

Include the module in your Terraform configuration:

module "azure_vm" {
  source               = "./azure-vm-module"
  vm_name              = var.vm_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  ssh_key_path         = var.ssh_key_path

  image_gallery_name   = var.image_gallery_name
  image_name           = var.image_name
  image_resource_group = var.image_resource_group

  subnet_id            = var.subnet_id
}

2️⃣ Define Variables (variables.tf)

variable "vm_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "vm_size" { default = "Standard_D2s_v3" }
variable "admin_username" { default = "azureuser" }
variable "ssh_key_path" { default = "~/.ssh/id_rsa.pub" }

variable "image_gallery_name" {}
variable "image_name" {}
variable "image_resource_group" {}

variable "subnet_id" {}

3️⃣ Environment-Specific Configuration (sandbox.tfvars)

vm_name              = "sandbox-vm"
resource_group_name  = "sandbox-rg"
location             = "East US"
vm_size              = "Standard_D2s_v3"
admin_username       = "sandboxadmin"
ssh_key_path         = "~/.ssh/sandbox_id_rsa.pub"

image_gallery_name   = "my-image-gallery"
image_name           = "packer-built-image"
image_resource_group = "image-rg"

subnet_id            = "/subscriptions/<sub_id>/resourceGroups/sandbox-rg/providers/Microsoft.Network/virtualNetworks/myVNet/subnets/mySubnet" #This is copied from the subnet of the Vnet created

4️⃣ Apply the Terraform Configuration

terraform init
terraform apply -var-file=sandbox.tfvars -auto-approve

Outputs

Name

Description

vm_id

The ID of the provisioned VM

vm_private_ip

The private IP address of the VM

vm_public_ip

The public IP address (if applicable)

Requirements

Terraform >= 1.0

Azure CLI configured

SSH key pair for authentication

Future Enhancements

Add support for auto-scaling

Integrate security group configurations

Extend to support Windows VMs
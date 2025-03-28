   module "azure" {
  source = "./azure/vm-machine"
  environment         = var.environment
  vm_name             = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  instance_type       = var.instance_type
  subnet_id           = var.subnet_id
  ssh_public_key      = var.ssh_public_key
  default_tags        = var.default_tags
}
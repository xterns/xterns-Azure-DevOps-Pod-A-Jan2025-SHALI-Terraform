module "azure_vm" {
  source              = "./azure-vm"
  environment         = var.environment
  vm_name             = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  image_name          = var.myPackerImage
  instance_type       = var.instance_type
  subnet_id           = var.subnet_id
  key_pair_name       = var.key_pair_name
  ssh_public_key      = var.ssh_public_key
  default_tags        = var.default_tags
}
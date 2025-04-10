module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  vnet_tags           = var.vnet_tags
  environment         = var.environment

  virtual_wan_name     = var.virtual_wan_name  # Ensure this is defined
  virtual_wan_location = var.virtual_wan_location  # Ensure this is defined
  vnet_attachments     = var.vnet_attachments  # Ensure this is defined
}

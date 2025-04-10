provider "azurerm" {
  features {}
}

# Call the vnet module
module "production_vnet" {
  source              = "../../modules/vnet"  # Path to your vnet module
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  environment         = var.environment
  location            = var.location
  vnet_name           = var.vnet_name
  vnet_tags           = var.vnet_tags
  }

module "virtual_wan" {
  source = "../../modules/virtual_wan"

  resource_group_name  = var.resource_group_name
  location             = var.location
  virtual_wan_name     = var.virtual_wan_name
  virtual_wan_location = var.location
  virtual_wan_type     = var.virtual_wan_type
  
  vnet_attachments = {
  production = {
    vnet_id = module.production_vnet.vnet_id
    internet_security_enabled = true
  }
}

   virtual_wan_route_tables = var.virtual_wan_route_tables
}
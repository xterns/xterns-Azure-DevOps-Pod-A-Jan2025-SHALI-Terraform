module "vnet" {
  source              = "./module/vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = "xterns-pod" # Now this will work!
  address_space       = var.address_space
  tags                = var.tags
}

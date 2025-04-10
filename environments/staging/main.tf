module "vnet" {
  source      = "../../modules/vnet"
  resource_group_name = var.resource_group_name
  address_space  = var.address_space
  environment = var.environment
  location = var.location
  vnet_name = var.vnet_name
  tags      = var.tags
}

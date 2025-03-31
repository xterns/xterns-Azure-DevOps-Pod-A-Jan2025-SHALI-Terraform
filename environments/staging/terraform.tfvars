# ✅ Define Virtual Network (VNet) configuration for Staging
vnet_name       = "xterns-Azure-PodA-Jan2025-staging-vnet"
address_space   = ["10.2.0.0/16"]
environment     = "staging"
location        = "East US"
resource_group_name = "xterns-pod"
vnet_tags       = {
  environment = "staging"
}

############################################################
virtual_wan_name     = "xterns-Azure-PodA-Jan2025-virtualwan"
virtual_wan_type     = "Standard"
virtual_wan_location = "East US"


# Uncomment and modify the route tables as necessary for staging
# virtual_wan_route_tables = [
#   {
#     name = "staging-to-others"
#     routes = [
#       {
#         name                = "to-production"
#         destinations        = ["10.3.0.0/16"]
#         destinations_type   = "CIDR"
#         next_hop_type       = "IP"
#         next_hop_ip_address = "192.168.3.1"
#         next_hop            = "192.168.3.1"
#       },
#       {
#         name                = "to-sandbox"
#         destinations        = ["10.1.0.0/16"]
#         destinations_type   = "CIDR"
#         next_hop_type       = "IP"
#         next_hop_ip_address = "192.168.1.1"
#         next_hop            = "192.168.1.1"
#       }
#     ]
#   }
# ]

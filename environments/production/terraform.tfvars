# ✅ Define Virtual Network (VNet) configuration
vnet_name       = "xterns-Azure-PodA-Jan2025-prod-vnet"
address_space   = ["10.3.0.0/16"]
environment     = "production"
location        = "East US"
resource_group_name = "xterns-pod"
vnet_tags       = {
  environment = "production"
}

############################################################
virtual_wan_name     = "xterns-Azure-PodA-Jan2025-virtualwan"
virtual_wan_type     = "Standard"
virtual_wan_location = "East US"


# virtual_wan_route_tables = [
  # {
    # name = "production-to-others"
    # routes = [
      # {
        # name                = "to-sandbox"
        # destinations        = ["10.2.0.0/16"]
        # destinations_type   = "CIDR"
        # next_hop_type       = "ResourceId"
        # next_hop            = "/subscriptions/eb5bd4ae-c988-4a12-9a3e-ef57702a86c9/resourceGroups/xterns-pod/providers/Microsoft.Network/virtualNetworks/xterns-Azure-PodA-Jan2025-sandbox-vnet"
      # },
      # {
        # name                = "to-staging"
        # destinations        = ["10.3.0.0/16"]
        # destinations_type   = "CIDR"
        # next_hop_type       = "ResourceId"
        # next_hop            = "/subscriptions/eb5bd4ae-c988-4a12-9a3e-ef57702a86c9/resourceGroups/xterns-pod/providers/Microsoft.Network/virtualNetworks/xterns-Azure-PodA-Jan2025-staging-vnet"
      # }
    # ]
  # }
# ]

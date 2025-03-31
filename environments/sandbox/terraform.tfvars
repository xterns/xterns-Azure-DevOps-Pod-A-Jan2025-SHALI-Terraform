# terraform.tfvars

# VNet configuration
vnet_name        = "xterns-Azure-PodA-Jan2025-sandbox-vnet"
address_space    = ["10.1.0.0/16"]
environment      = "sandbox"
location         = "East US"
resource_group_name = "xterns-pod"
vnet_tags = {
  environment = "sandbox"
}

# VWAN configuration
virtual_wan_name     = "xterns-Azure-PodA-Jan2025-virtualwan"
virtual_wan_type     = "Standard"
virtual_wan_location = "East US"

# VWAN route tables
virtual_wan_route_tables = [
  {
    name   = "sandbox-to-others"
    labels = ["custom"]
    routes = [
      # Commenting out invalid routes for now
      # {
      #   name                = "to-staging"
      #   destinations        = ["10.2.0.0/16"]
      #   destinations_type   = "CIDR"
      #   next_hop_type       = "None"               # ❌ Invalid
      #   next_hop            = null                 # ❌ Missing required
      #   next_hop_ip_address = null
      # },
      # {
      #   name                = "to-production"
      #   destinations        = ["10.3.0.0/16"]
      #   destinations_type   = "CIDR"
      #   next_hop_type       = "None"               # ❌ Invalid
      #   next_hop            = null                 # ❌ Missing required
      #   next_hop_ip_address = null
      # }
    ]
  }
]




# Azure Virtual WAN Terraform Module

## Overview
This module provisions an **Azure Virtual WAN** and supports **VNet attachments** with **custom routing**.

## Usage
```hcl
module "vwan" {
  source             = "../modules/vnet"
  virtual_wan_name   = "my-vwan"
  virtual_wan_region = "eastus"
  virtual_wan_tags   = { "Project" = "CloudInfra" }

  vnet_attachments = {
    "vnet1" = { vnet_id = "/subscriptions/xyz/resourceGroups/abc/providers/Microsoft.Network/virtualNetworks/vnet1", internet_security_enabled = true }
  }

  virtual_wan_route_tables = [
    {
      name   = "route-table-1"
      routes = [
        { name = "route1", destinations = ["10.0.0.0/16"], next_hop_type = "VirtualNetworkGateway" }
      ]
    }
  ]
}

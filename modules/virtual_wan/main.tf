resource "azurerm_virtual_wan" "this" {
  name                = var.virtual_wan_name
  location            = var.virtual_wan_location
  resource_group_name = var.resource_group_name
  type                = var.virtual_wan_type
}

resource "azurerm_virtual_hub" "this" {
  name                = "${var.virtual_wan_name}-hub"
  location            = var.virtual_wan_location
  resource_group_name = var.resource_group_name
  virtual_wan_id      = azurerm_virtual_wan.this.id
  address_prefix      = "10.100.0.0/24"
}

resource "azurerm_virtual_hub_route_table" "custom" {
  for_each = length(var.virtual_wan_route_tables) > 0 ? {
    for rt in var.virtual_wan_route_tables : rt.name => rt
  } : {}

  name           = each.value.name
  virtual_hub_id = azurerm_virtual_hub.this.id
  labels         = each.value.labels

  dynamic "route" {
    for_each = each.value.routes
    content {
      name              = route.value.name
      destinations      = route.value.destinations
      destinations_type = route.value.destinations_type
      next_hop_type     = route.value.next_hop_type
      next_hop          = route.value.next_hop
    }
  }
}

resource "azurerm_virtual_hub_connection" "this" {
  for_each = var.vnet_attachments

  name                       = "${each.key}-connection"
  virtual_hub_id            = azurerm_virtual_hub.this.id
  remote_virtual_network_id = each.value.vnet_id
  internet_security_enabled = each.value.internet_security_enabled
}

resource "azurerm_virtual_hub_route_table_route" "routes" {
  for_each = length(var.virtual_wan_route_tables) > 0 ? {
    for route in flatten([
      for table in var.virtual_wan_route_tables : [
        for route in table.routes : {
          key                  = "${table.name}-${route.name}"
          route_table_name     = table.name
          name                 = route.name
          destinations         = route.destinations
          destinations_type    = route.destination_type
          next_hop_type        = try(route.next_hop_type, null)
          next_hop             = try(route.next_hop, null)
          next_hop_ip_address  = try(route.next_hop_ip_address, null)
        }
      ]
    ]) : route.key => route
  } : {}

  name              = each.value.name
  route_table_id    = azurerm_virtual_hub_route_table.custom[each.value.route_table_name].id
  destinations_type = each.value.destinations_type
  destinations      = each.value.destinations
  next_hop_type     = each.value.next_hop_type
  next_hop          = each.value.next_hop
  # Note: next_hop_ip_address is not used directly in this resource.
}

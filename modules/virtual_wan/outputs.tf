output "virtual_wan_id" {
  value = azurerm_virtual_wan.this.id
}

output "virtual_hub_id" {
  value = azurerm_virtual_hub.this.id
}

output "route_table_ids" {
  value = { for k, v in azurerm_virtual_hub_route_table.custom : k => v.id }
}

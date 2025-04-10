output "vnet_name" {
  description = "The name of the created VNet"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  description = "The ID of the created VNet"
  value       = azurerm_virtual_network.vnet.id
}

# output "debug_vnet_attachments" {
#  value = var.vnet_attachments
# }

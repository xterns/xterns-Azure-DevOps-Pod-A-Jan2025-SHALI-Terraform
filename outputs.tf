output "vnet_name" {
  description = "The name of the created VNet"
  value       = module.vnet.vnet_name  # Referencing the module output
}

output "vnet_id" {
  description = "The ID of the created VNet"
  value       = module.vnet.vnet_id  # Referencing the module output
}

output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "The ID of the created VM"
}

output "image_name" {
  value = myPackerImage
   description = "packer image"
}
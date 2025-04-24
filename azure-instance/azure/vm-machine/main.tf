# Retrieve latest Packer-built image
data "azurerm_image" "latest" {
  name                ="xtern-vm-webserver"
  resource_group_name = "xterns-pod"
}

# Deploy Azure Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
 name                = "${var.environment}-vm-${var.vm_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.instance_type
  admin_username      = "azureuser"

  network_interface_ids = [azurerm_network_interface.nic.id]
     source_image_id = [data.azurerm_image.latest.id]

    admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}
# Create Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.environment}-nic-${var.vm_name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}


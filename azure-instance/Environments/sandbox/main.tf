# Retrieve latest Packer-built image
data "azurerm_image" "latest" {
  name_regex          = "^my-packer-image-${var.environment}-.*"
  resource_group_name = var.resource_group_name
  sort_descending     = true
}

# Virtual Machine Resource
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.environment}-vm-${var.vm_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.instance_type
  admin_username      = "adminuser"
  
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  source_image_id = data.azurerm_image.latest.id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_public_key
  }

  tags = merge(
    var.default_tags,
    {
      environment = var.environment
    }
  )
}

# Network Interface
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
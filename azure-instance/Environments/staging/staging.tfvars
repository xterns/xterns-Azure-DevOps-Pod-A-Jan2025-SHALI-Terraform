environment = "staging"
# image_name          = "myPackerImage"
vm_name             = "xtern-vm-webserver"
resource_group_name = "xterns-pod"
location            = "East US"
# image_sku           = "22_04-lts"
instance_type  = "Standard_B1s"
subnet_id      = "/subscriptions/xxxx/resourceGroups/xterns-pod/providers/Microsoft.Network/virtualNetworks/lekan_trial/subnets/default"
ssh_public_key = "ssh-rsa ...."

default_tags = {
  project    = "my-project"
  owner      = "lehqandiya@gmail.com"
  managed_by = "Terraform"
}
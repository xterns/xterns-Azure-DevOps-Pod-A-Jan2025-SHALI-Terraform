environment         = "sandbox"
vm_name             = "Sandbox-webserver"
resource_group_name = "xterns-pod"
location            = "eastus"
instance_type       = "BIs"
subnet_id           = "/subscriptions/xxx/resourceGroups/xterns-pod/providers/Microsoft.Network/virtualNetworks/vnet/subnets/default"
ssh_public_key      = "ssh-rsa AAAAB3NzaC1yc2E..."
default_tags = {
  project = "azure-Shali-sandbox"
  env     = "sandbox"
}
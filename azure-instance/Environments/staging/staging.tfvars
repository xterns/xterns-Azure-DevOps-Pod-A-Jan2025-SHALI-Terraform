environment         = "staging"
vm_name             = "Staging-webserver"
resource_group_name = "xterns-pod"
location            = "east us"
instance_type       = "BIs"
subnet_id           = "/subscriptions/xxx/resourceGroups/xterns-pod/providers/Microsoft.Network/virtualNetworks/vnet/subnets/default"
ssh_public_key      = "ssh-rsa AAAAB3NzaC1yc2E..."
default_tags = {
  project = "azure-Shali-staging"
  env     = "staging"
}
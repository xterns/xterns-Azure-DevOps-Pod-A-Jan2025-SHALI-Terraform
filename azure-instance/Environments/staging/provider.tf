terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}


provider "azurerm" {
  features {}
 subscription_id                   = ${{secrets.subscription_id}}
  tenant_id                        = ${{secrets.tenant_id}}     
}

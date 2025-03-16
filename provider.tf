terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

# provider "azurerm" {
#  features {}
# }

provider "azurerm" {
  features {}

  subscription_id = "eb5bd4ae-c988-4a12-9a3e-ef57702a86c9"
  use_oidc = true
}

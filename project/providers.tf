terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.106.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}


provider "azurerm" {
  use_oidc = true
  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
    }
  }
  # Configuration options
}

provider "tls" {}
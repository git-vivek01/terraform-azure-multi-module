terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 4.0"
        }
    }
    required_version = ">= 1.6.0"
}

# Service Principal Authentication
provider "azurerm" {
    features {}
  
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secrets
  tenant_id       = var.tenant_id

#backend configuration for remote state management
}
terraform {
  backend "azurerm" {
    resource_group_name = "rg-terraform-state"
    storage_account_name = "terraformremotestore"
    container_name = "remote-store"
    key = "terraform.tfstate"
  }
}

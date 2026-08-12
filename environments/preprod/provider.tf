terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "1e97a1db-308a-4a8e-8090-ba643e150e7e"
}
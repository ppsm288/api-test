terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "44e65d9b-1813-4eca-8e5a-781024679c6b"
  tenant_id       = "54666be7-1fd6-4743-bfdb-26549d11a2fd"
  client_id       = "aaad61ea-38ac-4ff2-b0f0-648cff1c50e6"
  client_secret   = "RuE8Q~EbwIW2LfZlW1ZYxNT~Po92.YVVoUAhUb47"
  
  features {}
  skip_provider_registration = "true"
}
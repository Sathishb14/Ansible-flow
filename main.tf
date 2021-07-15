terraform {
  backend "azurerm" {
    resource_group_name  = "git-rg1"
    storage_account_name = "gitsathish1"
    container_name       = "gitcontainer1"
    key                  = "terraformgit1.tfstate"
  }
}
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}
 
data "azurerm_client_config" "current1" {}
 
#Create Resource Group
resource "azurerm_resource_group" "uiop" {
  name     = "uiop"
  location = "eastus"
}
#Create Virtual Network
resource "azurerm_virtual_network" "vnet1" {
  name                = "tamops-vnet"
  address_space       = ["192.168.2.1/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.tamops.name
}
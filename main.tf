terraform {
  backend "azurerm" {
    resource_group_name  = "git-rg"
    storage_account_name = "gitsathish"
    container_name       = "gitcontainer"
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
  location = "centralindia"
}
#Create Virtual Network
resource "azurerm_virtual_network" "uiop1" {
  name                = "uiop1-vnet"
  address_space       = ["192.168.2.1/16"]
  location            = "centralindia"
  resource_group_name = azurerm_resource_group.git-rg.name
}
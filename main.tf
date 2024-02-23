# Configuring the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

#Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "West Europe"
}

# Create a Virtual Network
resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    address_space       = [var.vnet_address_space]
    location            = "West Europe"
    resource_group_name = azurerm_resource_group.rg.name
}

# Create a Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

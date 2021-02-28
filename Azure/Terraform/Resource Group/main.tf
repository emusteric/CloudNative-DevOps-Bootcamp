provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG" {
  name     = var.name
  location = var.location
  tags = {
    "locale" = "nz"
  }
}
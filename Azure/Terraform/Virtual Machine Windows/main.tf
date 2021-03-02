provider "azurerm" {
  features {}
}

#Resource Group
resource "azurerm_resource_group" "rg" {
  name = "benchallengerg"
  location = "australiaeast"
  tags = {
    "Cloudskills" = "Challenge"
  }
}

#Virtual Network
resource "azurerm_virtual_network" "vnet" {
    name = "challenge-network"
    address_space = [ "10.0.0.0/16" ]
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = {
      "CloudSkills" = "Challenge"
    }
}

#Subnet
resource "azurerm_subnet" "subnet" {
    name = "internal_subnet"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [ "10.0.1.0/24" ]
}

#Network Interface
resource "azurerm_network_interface" "nic" {
    name = "vmnic"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    
    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = "Dynamic"
    }
    
    tags = {
      "CloudSkills" = "Challenge"
    
    }
}

#Virtual Machine
resource "azurerm_windows_virtual_machine" "vm" {
    name = "CSBVM"
    resource_group_name = azurerm_resource_group.rg.name
    size = "Standard_B1s"
    location = azurerm_resource_group.rg.location
    admin_username = var.username  
    admin_password = var.securepassword
    network_interface_ids = [ azurerm_network_interface.nic.id ]
   
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2016-Datacenter"
      version = "latest"
    }
  
}
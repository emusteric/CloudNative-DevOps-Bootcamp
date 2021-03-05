provider "azurerm" {
  features {}
}

#Resource Group
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
  tags = {
    "CloudSkills" = "Challenge"
  }
}

#Virtual Network
resource "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    address_space = var.address_space
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = {
      "CloudSkills" = "Challenge"
    }
}

#Subnet
resource "azurerm_subnet" "subnet" {
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.subnet_address_range
}

#Network Interface
resource "azurerm_network_interface" "nic" {
    name = var.nic_name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    
    ip_configuration {
      name = var.nic_ipconfig_name
      subnet_id = azurerm_subnet.subnet.id
      private_ip_address_allocation = var.nic_ip_allocation_method
    }
    tags = {
      "CloudSkills" = "Challenge"
    }
}

#Virtual Machine
resource "azurerm_windows_virtual_machine" "vm" {
    name = "terratest"
    resource_group_name = azurerm_resource_group.rg.name
    size = var.vm_size
    location = azurerm_resource_group.rg.location
    admin_username = var.username  
    admin_password = var.securepassword
    network_interface_ids = [ azurerm_network_interface.nic.id ]
   
    os_disk {
      caching = var.os_disk_cache_type
      storage_account_type = var.os_storage_type
    }

    source_image_reference {
      publisher = var.os_publisher
      offer = var.os_offer
      sku = var.os_sku
      version = var.os_version
    }
  
}

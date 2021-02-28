output "name" {
    description = "Resource Group Name"
    value = azurerm_resource_group.RG.name
}

output "location" {
    description = "Location of Resource Group"
    value = azurerm_resource_group.RG.location
}

output "id" {
    description = "Subscription ID"
    value = azurerm_resource_group.RG.id
}


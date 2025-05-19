output "name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnets" {
  description = "Get all subnets"
  value       = azurerm_subnet.subnet
}

output "id" {
  description = "The vnet id"
  value       = azurerm_virtual_network.vnet.id
}


output "resource_group_name" {
  value = azurerm_resource_group.test-rg.name
}

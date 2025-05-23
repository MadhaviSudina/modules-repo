resource "azurerm_resource_group" "test-rg" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.vnet_address_spaces

  tags = {
    environment = "Terraform"
  }
  
  depends_on = [
    azurerm_resource_group.test-rg
  ]


}

resource "azurerm_subnet" "subnet" {
  for_each                                      = var.subnets
  name                                          = each.value.name
  resource_group_name                           = var.resource_group
  virtual_network_name                          = azurerm_virtual_network.vnet.name
  address_prefixes                              = each.value.address_prefixes
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled
  depends_on = [
    azurerm_resource_group.test-rg,
    azurerm_virtual_network.vnet
  ]
}

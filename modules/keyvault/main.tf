resource "azurerm_key_vault" "akv" {
  location                      = var.location
  name                          = local.name
  resource_group_name           = var.resource_group
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = var.sku_name
  enable_rbac_authorization     = var.enable_rbac_authorization
  tags                          = var.tags
  public_network_access_enabled = var.public_network_access_enabled
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled

  network_acls {
    default_action             = var.network_acl_default_action
    bypass                     = var.network_acl_bypass
    ip_rules                   = var.network_acl_ip_rules
    virtual_network_subnet_ids = var.network_acl_virtual_network_subnet_ids
  }
}

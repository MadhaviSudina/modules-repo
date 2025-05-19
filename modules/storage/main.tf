resource "azurerm_storage_account" "sta" {
  name                            = local.name
  resource_group_name             = var.resource_group
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  tags = {
    environment = "Terraform"
  }
   depends_on = [
    azurerm_resource_group.test-rg
  ]
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = local.name
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.sku_name

  os_disk {
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }
  admin_username = var.linux_configuration.admin_username
  admin_ssh_key {
    username   = var.linux_configuration.admin_username
    public_key = var.linux_configuration.public_key
  }

  tags = var.tags
}

resource "azurerm_network_interface" "nic" {
  name                = local.nic_name
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = var.context
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"


    #public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  tags = var.tags
}

# resource "azurerm_public_ip" "public_ip" {
#   name                = var.public_ip_address_name
#   location            = var.location
#   resource_group_name = var.resource_group
#   allocation_method   = "Dynamic"
#   sku                 = "Standard"
# }

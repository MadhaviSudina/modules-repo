
data "azurerm_platform_image" "ubuntu" {
  location  = var.location
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "20_04-lts"
}

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
    publisher = data.azurerm_platform_image.ubuntu.publisher
    offer     = data.azurerm_platform_image.ubuntu.offer
    sku       = data.azurerm_platform_image.ubuntu.sku
    version   = data.azurerm_platform_image.ubuntu.version

  }
  admin_username = var.linux_configuration.admin_username
  admin_ssh_key {
    username   = var.linux_configuration.admin_username
    public_key = var.linux_configuration.public_key
  }

  tags = {
    environment = "Terraform"
  }
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
  tags = {
    environment = "Terraform"
  }
}

# resource "azurerm_public_ip" "public_ip" {
#   name                = var.public_ip_address_name
#   location            = var.location
#   resource_group_name = var.resource_group
#   allocation_method   = "Dynamic"
#   sku                 = "Standard"
# }

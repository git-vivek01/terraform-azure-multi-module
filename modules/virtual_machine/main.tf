resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [var.network_interface_id]

  os_disk {
    name                 = var.storage_os_disk.name
    caching              = var.storage_os_disk.caching
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.storage_image_reference.publisher
    offer     = var.storage_image_reference.offer
    sku       = var.storage_image_reference.sku
    version   = var.storage_image_reference.version
  }

  disable_password_authentication = var.os_profile_linux_config.disable_password_authentication
}

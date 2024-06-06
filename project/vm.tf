resource "azurerm_linux_virtual_machine" "serbeniuk" {
  name                = "public-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_D1_v2"
  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.private.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  computer_name                   = "publicvm"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.vm_ssh_key.public_key_openssh
  }

  tags = {
    environment = "Production"
  }
}
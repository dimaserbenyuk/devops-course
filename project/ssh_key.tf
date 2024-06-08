# # Generate SSH key pair
# resource "tls_private_key" "vm_ssh_key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "azurerm_key_vault_secret" "ssh_private_key" {
#   name         = "ssh-private-key"
#   value        = tls_private_key.vm_ssh_key.private_key_pem
#   key_vault_id = azurerm_key_vault.vault.id
#   content_type = "text/plain"
# }

# resource "azurerm_key_vault_secret" "ssh_public_key" {
#   name         = "ssh-public-key"
#   value        = tls_private_key.vm_ssh_key.public_key_openssh
#   key_vault_id = azurerm_key_vault.vault.id
#   content_type = "text/plain"
# }

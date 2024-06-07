# output "resource_group_name" {
#   value = azurerm_resource_group.example.name
# }

# output "tls_private_key" {
#   value     = tls_private_key.vm_ssh_key.private_key_pem
#   sensitive = true

# }

output "sp_client_id" {
  value       = azuread_service_principal.this.client_id
  description = "The service principal application id"
}

output "sp_password" {
  value       = azuread_application_password.this.value
  description = "The service principal password"
  sensitive   = true
}

output "sp_application_name" {
  value       = azuread_application.this.display_name
  description = "The name of the application"
}

output "sp_object_id" {
  value       = azuread_service_principal.this.object_id
  description = "Object ID for the service principal"
}

output "credential_id" {
  value = azuread_application_federated_identity_credential.main.id
}
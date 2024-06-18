resource "azurerm_container_registry" "frontend" {
  name                = "frontend${lower(random_id.storage_account.hex)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = true
}
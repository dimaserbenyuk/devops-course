# Define the virtual network
resource "azurerm_virtual_network" "vpc" {
  name                = "my-network"
  location            = azurerm_resource_group.DK-m.location
  resource_group_name = azurerm_resource_group.DK-m.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    # security_group = azurerm_network_security_group.private.id
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    # security_group = azurerm_network_security_group.private.id
  }

  tags = {
    environment = "Production"
  }
}

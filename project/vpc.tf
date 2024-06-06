resource "azurerm_resource_group" "resgroup" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Define the virtual network
resource "azurerm_virtual_network" "virtnet" {
  name                = "my-network"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name
  address_space       = ["10.0.0.0/19"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet01"
    address_prefix = "10.0.10.0/24"
    security_group = azurerm_network_security_group.private.id
  }

  subnet {
    name           = "subnet02"
    address_prefix = "10.0.20.0/24"
    security_group = azurerm_network_security_group.private.id
  }

  tags = {
    environment = "Production"
    owner = "Serhii"
  }
}

# Define the private network security group with rules for SSH, HTTP, and HTTPS
resource "azurerm_network_security_group" "private" {
  name                = "private-nsg"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_http"
    priority                   = 301
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_https"
    priority                   = 302
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the network interface
resource "azurerm_network_interface_security_group_association" "nsg-associate" {
  network_interface_id      = azurerm_network_interface.private.id
  network_security_group_id = azurerm_network_security_group.private.id
}

resource "azurerm_network_interface" "private" {
  name                = "private-nic"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_virtual_network.virt.subnet.*.id[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.nat_gateway_ip.id
  }
}

# Define the public IP for NAT Gateway
resource "azurerm_public_ip" "nat_gateway_ip" {
  name                = "natGatewayIP"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Define the NAT Gateway
resource "azurerm_nat_gateway" "nat_gateway" {
  name                = "natGateway"
  location            = azurerm_resource_group.resgroup.location
  resource_group_name = azurerm_resource_group.resgroup.name
  sku_name            = "Standard"
}


# Associate the NAT Gateway with the subnets
resource "azurerm_subnet_nat_gateway_association" "subnet1_nat_gateway_assoc" {
  subnet_id      = azurerm_virtual_network.virtnet.subnet.*.id[0]
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}

resource "azurerm_subnet_nat_gateway_association" "subnet2_nat_gateway_assoc" {
  subnet_id      = azurerm_virtual_network.virtnet.subnet.*.id[1]
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}
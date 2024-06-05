<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.106.1 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.106.1 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.ssh_private_key](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.ssh_public_key](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/key_vault_secret) | resource |
| [azurerm_linux_virtual_machine.serbeniuk](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/linux_virtual_machine) | resource |
| [azurerm_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/nat_gateway) | resource |
| [azurerm_network_interface.private](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.my-nsg-assoc](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.private](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.nat_gateway_ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/resource_group) | resource |
| [azurerm_subnet_nat_gateway_association.subnet1_nat_gateway_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/subnet_nat_gateway_association) | resource |
| [azurerm_subnet_nat_gateway_association.subnet2_nat_gateway_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/subnet_nat_gateway_association) | resource |
| [azurerm_virtual_network.vpc](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/resources/virtual_network) | resource |
| [tls_private_key.vm_ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.106.1/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | n/a | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"serbeniuk"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tls_private_key"></a> [tls\_private\_key](#output\_tls\_private\_key) | n/a |
<!-- END_TF_DOCS -->
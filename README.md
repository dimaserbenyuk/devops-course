# devops-course

[![az-oidc-test](https://github.com/dimaserbenyuk/devops-course/actions/workflows/terraform.yaml/badge.svg?branch=main)](https://github.com/dimaserbenyuk/devops-course/actions/workflows/terraform.yaml)  [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/dimaserbenyuk/devops-course/blob/master/LICENSE.md)

![image](/images/aks-terraform-oidc.svg)


# Azure login cli

```bash
az login --use-device-code
```

```bash
az account list
```

```json
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "1d31*888888888888*d1",
    "id": "e14444444444444a1a687",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Azure subscription 1",
    "state": "Enabled",
    "tenantDefaultDomain": "dmy44444444t.com",
    "tenantDisplayName": "Default Directory",
    "tenantId": "144444441d1",
    "user": {
      "name": "dm44444444.com",
      "type": "user"
    }
  }
]

```

```bash
az account show --output table
```

```bash
account show --output table
```

```
EnvironmentName    HomeTenantId                          IsDefault    Name                  State    TenantDefaultDomain                      TenantDisplayName    TenantId
-----------------  ------------------------------------  -----------  --------------------  -------  ---------------------------------------  -------------------  ------------------------------------
AzureCloud         1d3********************************d1  True         Azure subscription 1  Enabled  dm********************************.com  Default Directory    1d*************************d1
```

```terraform
terraform output -raw sp_password > secureadmin
```
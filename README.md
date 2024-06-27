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

[MongoDB Community Edition](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/)

To install MongoDB, run the following command in your macOS Terminal application

```
brew install mongodb-community@7.0
```

The installation includes the following binaries:

- The `mongod` server

- The `mongos` sharded cluster query router

- The MongoDB Shell, `mongosh`

```config
Intel Processor configuration file
/usr/local/etc/mongod.conf
/usr/local/var/log/mongodb
/usr/local/var/mongodb

Apple Silicon Processor
/opt/homebrew/etc/mongod.conf
/opt/homebrew/var/log/mongodb
/opt/homebrew/var/mongodb
```

```sh
brew services list

brew services start mongodb-community@7.0

brew services stop mongodb-community@7.0
```


```shell

mongodb git:(nextjs-docker) ✗ mongosh   
Current Mongosh Log ID: 666a8f5cafb1a67a700a25d4
Connecting to:          mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.2.6
Using MongoDB:          7.0.11
Using Mongosh:          2.2.6

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting
   2024-06-13T08:18:50.841+02:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

```

```
rs.initiate({_id:"rs0", members: [{_id:0, host:"127.0.0.1:27017", priority:100}, {_id:1, host:"127.0.0.1:27018", priority:50}, {_id:2, host:"127.0.0.1:27019", arbiterOnly:true}]})

```

```
{ ok: 1 }



helm install argo-cd argo/argo-cd --values argo-cd/my-values.yaml
    server.insecure: true
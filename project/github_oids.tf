data "azurerm_subscription" "this" {}
data "azuread_client_config" "current" {}
data "azuread_application_published_app_ids" "well_known" {}

locals {
  scope    = data.azurerm_subscription.this.id
  app_name       = "tf-oidc-test-sample"
}

data "azuread_user" "this" {
  user_principal_name = "dmytroserbeniukdev_gmail.com#EXT#@dmytroserbeniukdevgmail.onmicrosoft.com"
}


resource "azuread_application" "this" {
  display_name = local.app_name
  web {
    implicit_grant {
      access_token_issuance_enabled = true
    }
  }
  owners = [data.azuread_client_config.current.object_id, data.azuread_user.this.object_id]

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    resource_access {
      # id   = azuread_service_principal.msgraph.app_role_ids["Application.ReadWrite.All"]
      # hardcoding as the above access to lookup does not exist - references can be found here: https://docs.microsoft.com/en-us/graph/permissions-reference
      id   = "18a4783c-866b-4cc7-a460-3d5e5662c884"
      type = "Role"
    }
    resource_access {
      # "User.Read.All"
      # hardcoding as the above access to lookup does not exist - references can be found here: https://docs.microsoft.com/en-us/graph/permissions-reference
      id   = "df021288-bdef-4463-88db-98f22de89214"
      type = "Role"
    }
    resource_access {
      # "User.Read.All"
      # hardcoding as the above access to lookup does not exist - references can be found here: https://docs.microsoft.com/en-us/graph/permissions-reference
      id   = "1bfefb4e-e0b5-418b-a88f-73c46d2cc8e9"
      type = "Role"
    }
    resource_access {
      # "User.Read.All"
      # hardcoding as the above access to lookup does not exist - references can be found here: https://docs.microsoft.com/en-us/graph/permissions-reference
      id   = "06b708a9-e830-4db3-a914-8e69da51d44f"
      type = "Role"
    }
  }
}

resource "azuread_service_principal" "this" {
  client_id                    = azuread_application.this.client_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id, data.azuread_user.this.object_id]
  #   lifecycle {
  #     prevent_destroy = false
  #   }
}

# Can comment this: Will not need password for pure OIDC. This is for purposes of local
resource "azuread_application_password" "this" {
  application_id = azuread_application.this.id
  display_name   = "tf-credentials"
  end_date       = "2099-01-01T01:02:03Z"
}


resource "azurerm_role_assignment" "sub-contributor" {
  scope                = local.scope
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.this.id
  // If new SP there  may be replciation lag this disables validation
  skip_service_principal_aad_check = true
  lifecycle {
    ignore_changes = [
      scope,
    ]
  }
}

resource "azuread_application_federated_identity_credential" "main" {
  application_id = azuread_application.this.id
  display_name   = "az-oidc-branch-main"
  description    = "deployments for repository cloud-cicd-exploration"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:dimaserbenyuk/devops-course:ref:refs/heads/main"
}

resource "azuread_application_federated_identity_credential" "pr" {
  application_id = azuread_application.this.id
  display_name   = "az-oidc-pr"
  description    = "deployments for repository cloud-cicd-exploration"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:dimaserbenyuk/devops-course:pull_request"
}

resource "azuread_application_federated_identity_credential" "env-prod" {
  application_id = azuread_application.this.id
  display_name   = "az-oidc-env-prod"
  description    = "deployments for repository cloud-cicd-exploration"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:dimaserbenyuk/devops-course:environment:prod"
}

resource "azuread_application_federated_identity_credential" "env-dev" {
  application_id = azuread_application.this.id
  display_name   = "az-oidc-env-dev"
  description    = "deployments for repository cloud-cicd-exploration"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:dimaserbenyuk/devops-course:environment:dev"
}
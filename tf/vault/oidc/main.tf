resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_policy" "developer-vault-policy" {
  name = "developer-vault-policy"

  policy = <<EOT
   path "dev-secrets/+/creds" {
   capabilities = ["create", "update"]
}
path "dev-secrets/+/creds" {
   capabilities = ["read"]
}
## Vault TF provider requires ability to create a child token
path "auth/token/create" {
   capabilities = ["create", "update", "sudo"]
}
EOT
}

resource "vault_generic_endpoint" "danielle-user" {
  path                 = "auth/${vault_auth_backend.userpass.path}/users/danielle-vault-user"
  ignore_absent_fields = true
  data_json = jsonencode({
    token_policies = ["developer-vault-policy"]
    password       = "Vividness Itinerary Mumbo Reassure"
  })
}

resource "vault_identity_entity" "test" {
  name     = "tester1"
  policies = ["test"]
  metadata = {
    email        = "vault@hashicorp.com"
    phone_number = "123-456-7890"
  }
  disabled = false
}

resource "vault_identity_group" "internal" {
  name              = "internal"
  type              = "internal"
  policies          = ["dev", "test"]
  member_entity_ids = [vault_identity_entity.test.id]
}

resource "vault_identity_entity_alias" "test" {
  name           = "user_1"
  mount_accessor = vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.test.id
}

resource "vault_identity_oidc_assignment" "default" {
  name = "assignment"
  entity_ids = [
    vault_identity_entity.test.id,
  ]
  group_ids = [
    vault_identity_group.internal.id,
  ]
}

resource "vault_identity_oidc_key" "key" {
  name               = "key"
  algorithm          = "RS256"
  allowed_client_ids = ["*"]
  verification_ttl   = "2h"
  rotation_period    = "1h"
}

resource "vault_identity_oidc_client" "test" {
  name = "my-app"
  redirect_uris = [
    "http://127.0.0.1:9200/v1/auth-methods/oidc:authenticate:callback",
    "http://127.0.0.1:8251/callback",
    "http://127.0.0.1:8080/callback"
  ]
  assignments = [
    vault_identity_oidc_assignment.test.name
  ]

  key = vault_identity_oidc_key.key.id

  id_token_ttl     = 2400
  access_token_ttl = 7200
}

resource "vault_identity_oidc_scope" "user" {
  name        = "user"
  template    = <<EOT
{
    "username": {{identity.entity.name}},
    "contact": {
        "email": {{identity.entity.metadata.email}},
        "phone_number": {{identity.entity.metadata.phone_number}}
    }
}
EOT    

  description = "Vault OIDC Groups Scope"
}

resource "vault_identity_oidc_scope" "groups" {
  name        = "groups"
  template    = <<EOT
{
    "groups": {{identity.entity.groups.names}}
}
EOT    

  description = "Vault OIDC Groups Scope"
}

resource "vault_identity_oidc_provider" "test" {
  name = "my-provider"
  allowed_client_ids = [
    vault_identity_oidc_client.test.client_id
  ]
  scopes_supported = [
    vault_identity_oidc_scope.user.name,
    vault_identity_oidc_scope.groups.name
  ]
}

# resource "vault_identity_oidc_role" "role" {
#   name = "role"
#   key  = vault_identity_oidc_key.key.name
# }

# resource "vault_identity_oidc_key_allowed_client_id" "role" {
#   key_name          = vault_identity_oidc_key.key.name
#   allowed_client_id = vault_identity_oidc_role.role.client_id
# }

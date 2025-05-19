resource "boundary_scope" "global" {
  global_scope = true
  description  = "My first global scope!"
  scope_id     = "global"
}

resource "boundary_scope" "org" {
  name                     = "Local"
  description              = "My first scope!"
  scope_id                 = boundary_scope.global.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}

## Use password auth method
resource "boundary_auth_method" "password" {
  name     = "Local Accounts"
  scope_id = boundary_scope.org.id
  type     = "password"
}

resource "boundary_account_password" "users_acct" {
  for_each       = var.users
  name           = each.key
  description    = "User account for ${each.key}"
  login_name     = lower(each.key)
  password       = each.value
  auth_method_id = boundary_auth_method.password.id
}

resource "boundary_user" "users" {
  for_each    = var.users
  name        = each.key
  description = "User resource for ${each.key}"
  scope_id    = boundary_scope.org.id
}

resource "boundary_user" "readonly_users" {
  for_each    = var.readonly_users
  name        = each.key
  description = "User resource for ${each.key}"
  scope_id    = boundary_scope.org.id
}

resource "boundary_group" "readonly" {
  name        = "read-only"
  description = "Organization group for readonly users"
  member_ids  = [for user in boundary_user.readonly_users : user.id]
  scope_id    = boundary_scope.org.id
}

resource "boundary_role" "organization_readonly" {
  name        = "Read-only"
  description = "Read-only role"
  principal_ids = [boundary_group.readonly.id]
  grant_strings = ["ids=*;type=*;actions=read"]
  scope_id    = boundary_scope.org.id
}

resource "boundary_role" "organization_admin" {
  name        = "admin"
  description = "Administrator role"
  principal_ids = concat(
    [for user in boundary_user.users: user.id]
  )
  grant_strings   = ["ids=*;type=*;actions=create,read,update,delete"]
  scope_id = boundary_scope.org.id
}

resource "boundary_scope" "proxmox" {
  name                   = "Proxmox"
  description            = "My first project!"
  scope_id               = boundary_scope.org.id
  auto_create_admin_role = true
}

resource "boundary_host_catalog_static" "backend_servers" {
  name        = "backend_servers"
  description = "Backend servers host catalog"
  scope_id    = boundary_scope.proxmox.id
}

resource "boundary_host_static" "backend_servers" {
  for_each        = var.backend_server_ips
  type            = "static"
  name            = each.key
  description     = each.value.desc
  address         = each.value.ip
  host_catalog_id = boundary_host_catalog_static.backend_servers.id
}

resource "boundary_host_set_static" "backend_servers_set" {
  type            = "static"
  name            = "backend_servers_set"
  description     = "Host set for backend servers"
  host_catalog_id = boundary_host_catalog_static.backend_servers.id
  host_ids        = [for host in boundary_host_static.backend_servers : host.id]
}

# create target for accessing backend servers on port :8000
resource "boundary_target" "backend_servers_service" {
  type         = "tcp"
  name         = "backend_server"
  description  = "Backend service target"
  scope_id     = boundary_scope.proxmox.id
  default_port = "8006"

  host_source_ids = [
    boundary_host_set_static.backend_servers_set .id
  ]
}

# create target for accessing backend servers on port :22
resource "boundary_target" "backend_servers_ssh" {
  type         = "tcp"
  name         = "ssh_server"
  description  = "Backend SSH target"
  scope_id     = boundary_scope.proxmox.id
  default_port = "22"

  host_source_ids = [
    boundary_host_set_static.backend_servers_set.id
  ]
}

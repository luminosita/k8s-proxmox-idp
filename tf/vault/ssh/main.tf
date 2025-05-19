resource "vault_mount" "ssh_vault" {
  path = "ssh1"
  type = "ssh"
  # description = local.vault.description

  # default_lease_ttl_seconds = 86400
  # max_lease_ttl_seconds     = local.ca.ttl
}

resource "vault_ssh_secret_backend_ca" "ssh_ca_backend" {
  backend = vault_mount.ssh_vault.path

  private_key = file("tmp/ca")
  public_key  = file("tmp/ca.pub")
}

resource "vault_ssh_secret_backend_role" "ssh_role_ca" {
  name                    = "ca_role"
  backend                 = vault_mount.ssh_vault.path
  key_type                = "ca"
  allow_user_certificates = true
  allowed_users           = "*"
  allowed_extensions      = "permit-pty,permit-port-forwarding"
  default_extensions = {
    permit-pty = ""
  }
  default_user = "ubuntu"
  ttl          = "30m0s"
}

resource "vault_ssh_secret_backend_role" "ssh_role_otp" {
  name          = "otp_role"
  backend       = vault_mount.ssh_vault.path
  key_type      = "otp"
  default_user  = "ubuntu"
  allowed_users = "*"
  cidr_list     = "0.0.0.0/0"
}

data "vault_ssh_secret_backend_sign" "test" {
  path             = vault_mount.ssh_vault.path
  public_key       = file("tmp/user.pub")
  name             = vault_ssh_secret_backend_role.ssh_role_ca.name
  valid_principals = "vault"
}

output "ca" {
  value = {
    serial_number = data.vault_ssh_secret_backend_sign.test.serial_number
    signed_key    = data.vault_ssh_secret_backend_sign.test.signed_key
  }
}

resource "vault_generic_endpoint" "otp_key" {
  depends_on           = [vault_ssh_secret_backend_role.ssh_role_otp]
  path                 = "sshaaa/creds/otp_role"
  disable_read         = true
  disable_delete       = true
  ignore_absent_fields = true
  write_fields         = ["key"]

  data_json = jsonencode({
    ip = "172.16.1.20"
  })
}

output "otp_key" {
  value = vault_generic_endpoint.otp_key.write_data
}
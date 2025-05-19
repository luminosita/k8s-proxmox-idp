vault = {
  endpoint = "https://172.16.1.21:8200"
}

ssh_ca = {
  ca_private_key = "/Users/milosh/.ssh/ca_user_key"
  ca_public_key = "/Users/milosh/.ssh/ca_user_key.pub"

  user_public_key = "tmp/user.pub"
}

ca = {
  root = {
    issuer      = "RootCA"
    issuer_name = "RootCA-Name"
    common_name = "vault.lan"
    role_name   = "CARole"

    allowed_domains = ["vault.lan"]

    description = "Root CA PKI"

    ttl      = 315360000
    role_ttl = 2592000
  }

  vault = {
    issuer      = "VaultCA"
    issuer_name = "VaultCA-Name"
    common_name = "vault.lan"
    role_name   = "VaultRole"

    allowed_domains = ["vault.lan", "*.vault.lan"]

    description = "Intermediate CA PKI"

    ttl      = 315360000
    role_ttl = 2592000
  }
}

certs = {
  vault_nodes = {
    name        = "vault-node"
    common_name = "node.vault.lan"

    ip_sans = ["127.0.0.1", "172.16.20.11", "172.16.20.12", "172.16.20.13"]

    ttl = 315360000
  }
}

oidc = {
  
}

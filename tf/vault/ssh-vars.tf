variable "ssh_ca" {
  type = object({
    ca_private_key  = string
    ca_public_key   = string
    user_public_key = string
  })
}

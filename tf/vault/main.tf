module "oidc" {
   source = "./oidc"

   oidc = var.oidc
}

# module "pki" {
#   source = "./pki"

#   ca    = var.ca
#   certs = var.certs
# }

# module "ssh" {
#   source = "./ssh"

#   ssh_ca    = var.ssh_ca
# }

output "result" {
  value = {
    serial_number = module.ssh.ca.serial_number
    signed_key = module.ssh.ca.signed_key
    otp_key = module.ssh.otp_key
  }
}
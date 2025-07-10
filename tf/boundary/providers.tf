terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.3.0"
    }
  }
}

provider "boundary" {
  addr                   = var.boundary.addr
  auth_method_id         = var.boundary.auth_method_id
  auth_method_login_name = var.boundary.password_auth_method_login_name
  auth_method_password   = var.boundary.password_auth_method_password
}


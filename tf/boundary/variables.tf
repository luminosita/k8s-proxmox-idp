variable "boundary" {
  type = object({
    addr                            = string
    auth_method_id                  = string
    password_auth_method_login_name = string
    password_auth_method_password   = string
  })
}

variable "users" {
  type = map(string)
}

variable "readonly_users" {
  type = map(string)
}

variable "backend_server_ips" {
  type = map(object({
    ip   = string
    desc = optional(string)
  }))
}


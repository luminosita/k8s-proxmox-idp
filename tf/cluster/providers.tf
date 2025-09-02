terraform {
  required_version = ">= 1.9.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.83.0"
    }    
    talos = {
      source  = "siderolabs/talos"
      version = "0.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
    restapi = {
      source  = "Mastercard/restapi"
      version = "2.0.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox.endpoint
  insecure = var.proxmox.insecure

  api_token = var.proxmox.api_token

  ssh {
    agent               = false
    username            = var.proxmox.ssh_username
    private_key         = file(var.proxmox.ssh_private_key_file)
  }
}

provider "restapi" {
  uri                  = var.proxmox.endpoint
  insecure             = var.proxmox.insecure
  write_returns_object = true

  headers = {
    "Content-Type"  = "application/json"
    "Authorization" = "PVEAPIToken=${var.proxmox.api_token}"
  }
}

provider "kubernetes" {
  host = module.talos-bootstrap.kube_config.kubernetes_client_configuration.host
  client_certificate = base64decode(module.talos-bootstrap.kube_config.kubernetes_client_configuration.client_certificate)
  client_key = base64decode(module.talos-bootstrap.kube_config.kubernetes_client_configuration.client_key)
  cluster_ca_certificate = base64decode(module.talos-bootstrap.kube_config.kubernetes_client_configuration.ca_certificate)
}

module "talos-bootstrap" {
  source = "../../modules/terraform-talos-bootstrap"

  providers = {
    talos = talos
    proxmox = proxmox
  }

  talos_image = var.talos_image
  talos_cluster_config = var.talos_cluster_config
  talos_nodes = var.talos_nodes
}

module "sealed_secrets" {
  depends_on = [ module.talos-bootstrap ]
  source = "../../modules/terraform-sealed-secrets"

  providers = {
    kubernetes = kubernetes
  }

  // openssl req -x509 -days 365 -nodes -newkey rsa:4096 -keyout sealed-secrets.key -out sealed-secrets.cert -subj "/CN=sealed-secret/O=sealed-secret"
  cert = {
    cert = file("${path.root}/${var.sealed_secrets_config.certificate_path}")
    key = file("${path.root}/${var.sealed_secrets_config.certificate_key_path}")
  }
}

module "proxmox_csi_plugin" {
  depends_on = [ module.talos-bootstrap ]
  source = "../../modules/terraform-proxmox-csi"

  providers = {
    proxmox    = proxmox
    kubernetes = kubernetes
  }

  #FIXME: Remove 
  proxmox = var.proxmox

  cluster_name = var.talos_cluster_config.name
}

module "volumes" {
  depends_on = [ module.proxmox_csi_plugin ]
  source = "../../modules/terraform-proxmox-volumes"

  providers = {
    restapi    = restapi
    kubernetes = kubernetes
  }

  #FIXME: Remove 
  proxmox_api = var.proxmox
  volumes = var.kubernetes_volumes

  cluster_name = var.talos_cluster_config.name
}

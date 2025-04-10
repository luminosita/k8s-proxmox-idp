proxmox = {
  name         = "proxmox"
  cluster_name = "proxmox"
  endpoint     = "https://proxmox.lan:8006"
  insecure     = true

  ssh_username         = "root"
  ssh_private_key_file = "~/.ssh/id_rsa"

  iso_datastore = "local"
}

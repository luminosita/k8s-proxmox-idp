talos_nodes = {
  "ctrl-k8s-00" = {
    host_node    = "proxmox"
    machine_type = "controlplane"
    ip           = "192.168.50.100"
    #dns           = ["1.1.1.1", "8.8.8.8"] # Optional Value.
    mac_address   = "BC:24:11:2E:D8:00"
    vm_id         = 700
    cpu           = 8
    ram_dedicated = 8192
#    igpu          = true
    datastore_id  = "vm-disks"
  }
  "ctrl-k8s-01" = {
    host_node    = "proxmox"
    machine_type = "controlplane"
    ip           = "192.168.50.101"
    #dns           = ["1.1.1.1", "8.8.8.8"] # Optional Value.
    mac_address   = "BC:24:11:2E:D8:01"
    vm_id         = 701
    cpu           = 8
    ram_dedicated = 8192
#    igpu          = true
    datastore_id  = "vm-disks"
  }
  "ctrl-k8s-02" = {
    host_node    = "proxmox"
    machine_type = "controlplane"
    ip           = "192.168.50.102"
    #dns           = ["1.1.1.1", "8.8.8.8"] # Optional Value.
    mac_address   = "BC:24:11:2E:D8:02"
    vm_id         = 702
    cpu           = 8
    ram_dedicated = 8192
#    igpu          = true
    datastore_id  = "vm-disks"
  }
  "work-k8s-00" = {
    host_node     = "proxmox"
    machine_type  = "worker"
    ip            = "192.168.50.110"
    mac_address   = "BC:24:11:2E:B8:00"
    vm_id         = 710
    cpu           = 8
    ram_dedicated = 8192
#    igpu          = true
    #update        = true
    datastore_id  = "vm-disks"
  }
}

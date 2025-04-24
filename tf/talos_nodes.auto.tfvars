talos_nodes = {
  "ctrl-idp-00" = {
    host_node    = "proxmox"
    machine_type = "controlplane"
    network = {
      dhcp = false #FIXME: Enable DHCP
      ip   = "192.168.20.40"
      #dns           = ["1.1.1.1", "8.8.8.8"] # Optional Value.
      mac_address = "bc:24:11:2e:d8:00"
      gateway     = "192.168.20.1"
      subnet_mask = "24"
      device      = "vmbr1"
      vlan_id     = 20
    }
    vm_id         = 500
    cpu           = 8
    ram_dedicated = 8192
    #    igpu          = true
    datastore_id = "vm-disks"
  }
  "ctrl-idp-01" = {
    host_node    = "proxmox"
    machine_type = "controlplane"
    network = {
      dhcp = false
      ip   = "192.168.20.41"
      #dns           = ["1.1.1.1", "8.8.8.8"] # Optional Value.
      mac_address = "bc:24:11:2e:d8:01"
      gateway     = "192.168.20.1"
      subnet_mask = "24"
      device      = "vmbr1"
      vlan_id     = 20
    }
    vm_id         = 501
    cpu           = 8
    ram_dedicated = 8192
    #    igpu          = true
    datastore_id = "vm-disks"
  }
  "ctrl-idp-02" = {
    host_node    = "proxmox"
    machine_type = "controlplane"
    network = {
      dhcp        = false
      ip          = "192.168.20.42"
      mac_address = "bc:24:11:2e:d8:02"
      gateway     = "192.168.20.1"
      subnet_mask = "24"
      device      = "vmbr1"
      vlan_id     = 20
    }
    vm_id         = 502
    cpu           = 8
    ram_dedicated = 8192
    #    igpu          = true
    datastore_id = "vm-disks"
  }
  "work-idp-00" = {
    host_node    = "proxmox"
    machine_type = "worker"
    network = {
      dhcp        = false
      ip          = "192.168.20.45"
      mac_address = "bc:24:11:2e:b8:00"
      gateway     = "192.168.20.1"
      subnet_mask = "24"
      device      = "vmbr1"
      vlan_id     = 20
    }
    vm_id         = 510
    cpu           = 8
    ram_dedicated = 8192
    #    igpu          = true
    #update        = true
    datastore_id = "vm-disks"
  }
}

talos_nodes = {
  "ctrl-idp-00" = {
    host_node    = "noa"
    machine_type = "controlplane"
    network = {
      dhcp        = true
      mac_address = "bc:24:11:2e:d8:00"
      device      = "vmbr1"
      vlan_id     = 20
    }
    vm_id         = 500
    cpu           = 4
    ram_dedicated = 8192
    datastore_id = "local-lvm"
  }
  "ctrl-idp-01" = {
    host_node    = "mina"
    machine_type = "controlplane"
    network = {
      dhcp        = true
      mac_address = "bc:24:11:2e:d8:01"
      device      = "vmbr0"
      vlan_id     = 20
    }
    vm_id         = 501
    cpu           = 8
    ram_dedicated = 8192
    datastore_id = "local-lvm"
  }
  "ctrl-idp-02" = {
    host_node    = "lena"
    machine_type = "controlplane"
    network = {
      dhcp        = true
      mac_address = "bc:24:11:2e:d8:02"
      device      = "vmbr0"
      vlan_id     = 20
    }
    vm_id         = 502
    cpu           = 8
    ram_dedicated = 8192
    datastore_id = "local-lvm"
  }
  "work-idp-00" = {
    host_node    = "mina"
    machine_type = "worker"
    network = {
      dhcp        = true
      mac_address = "bc:24:11:2e:b8:00"
      device      = "vmbr0"
      vlan_id     = 20
    }
    vm_id         = 510
    cpu           = 8
    ram_dedicated = 8192
    datastore_id = "local-lvm"
  }
}

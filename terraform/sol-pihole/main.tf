locals {
  ip_octet = 160
  vm_id    = 3000
}

data "vault_kv_secret_v2" "ssh" {
  mount = "tfsecrets"
  name  = "ssh/${var.pve_node}/ci"
}

resource "proxmox_lxc" "lxc" {
  count = 2

  hostname = "pihole${count.index}"
  vmid     = local.vm_id + count.index
  start    = true

  target_node = "solis"
  ostemplate  = "local:vztmpl/debian-11-standard_11.6-1_amd64.tar.zst"

  // Access
  password        = null
  ssh_public_keys = data.vault_kv_secret_v2.ssh.data.PUBLIC_KEY

  unprivileged = true
  onboot       = true
  tags         = join(";", sort(["net"])) # Proxmox sorts tags lexicographically

  /* Hardware */
  // CPU
  cores    = 1
  cpuunits = 100 # old default was 1024
  cpulimit = 1
  // RAM
  memory = 128
  swap   = 512

  network {
    name     = "eth0"
    bridge   = "vmbr4"
    firewall = false

    ip = "10.8.0.${local.ip_octet + count.index}/16" // "dhcp"
    gw = "10.8.0.1"

    hwaddr = null
    tag    = null
  }

  rootfs {
    storage = "extpool"
    size    = "4G"
  }

  features {
    nesting = true
    fuse    = false
    mount   = null // "nfs;cifs"
  }
}

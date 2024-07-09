terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "browningluke"

    workspaces {
      name = "pve-lxc-sol-pihole"
    }
  }
}

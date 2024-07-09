# --- Vault ---
provider "vault" {
  address = var.vault_url

  # Uncomment this block when not running locally (i.e. not with vault cli)
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.vault_approle_role_id
      secret_id = var.vault_approle_secret_id
    }
  }
}

data "vault_kv_secret_v2" "proxmox" {
  mount = "tfsecrets"
  name  = "pve/${var.pve_node}/terraform-prov"
}

provider "proxmox" {
  pm_api_url  = "${var.pve_https ? "https" : "http"}://${var.pve_host}:${var.pve_port}/api2/json"
  pm_user     = data.vault_kv_secret_v2.proxmox.data.PROVIDER_PVE_USER
  pm_password = data.vault_kv_secret_v2.proxmox.data.PROVIDER_PVE_PASS
}

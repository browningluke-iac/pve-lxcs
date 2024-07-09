# sol-pihole

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.1 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | ~> 2.9.14 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.14 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_lxc.lxc](https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/lxc) | resource |
| [vault_kv_secret_v2.proxmox](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/kv_secret_v2) | data source |
| [vault_kv_secret_v2.ssh](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/kv_secret_v2) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pve_host"></a> [pve\_host](#input\_pve\_host) | description | `string` | n/a | yes |
| <a name="input_pve_https"></a> [pve\_https](#input\_pve\_https) | n/a | `bool` | `true` | no |
| <a name="input_pve_node"></a> [pve\_node](#input\_pve\_node) | n/a | `string` | n/a | yes |
| <a name="input_pve_port"></a> [pve\_port](#input\_pve\_port) | n/a | `string` | `"8006"` | no |
| <a name="input_vault_approle_role_id"></a> [vault\_approle\_role\_id](#input\_vault\_approle\_role\_id) | n/a | `string` | n/a | yes |
| <a name="input_vault_approle_secret_id"></a> [vault\_approle\_secret\_id](#input\_vault\_approle\_secret\_id) | n/a | `string` | n/a | yes |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | --- Vault --- | `string` | `"https://vault.browningluke.dev"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

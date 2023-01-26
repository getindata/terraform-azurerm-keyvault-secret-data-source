locals {
  enabled = module.this.enabled

  secrets = merge([
    for key_vault, config in var.key_vaults : {
      for name in config.secrets : "${key_vault}/${name}" => {
        key_vault : key_vault
        key_vault_id : config.key_vault_id
        name : name
      }
    }
  ]...)

  key_vaults = [
    for secret in local.secrets : {
      (secret.key_vault) : {
        key_vault_id : secret.key_vault_id
        secrets : {
          (secret.name) : data.azurerm_key_vault_secret.this["${secret.key_vault}/${secret.name}"].value
        }
      }
    } if local.enabled
  ]
}

module "deepmerge" {
  source  = "Invicton-Labs/deepmerge/null"
  version = "0.1.5"

  maps = local.key_vaults
}

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

  key_vaults = merge([
    for secret in local.secrets : {
      (secret.key_vault) : {
        secrets : {
          (secret.name) : {
            id : data.azurerm_key_vault_secret.this["${secret.key_vault}/${secret.name}"].id
            name : data.azurerm_key_vault_secret.this["${secret.key_vault}/${secret.name}"].name
            key_vault_id : data.azurerm_key_vault_secret.this["${secret.key_vault}/${secret.name}"].key_vault_id
            value : data.azurerm_key_vault_secret.this["${secret.key_vault}/${secret.name}"].value
            version : data.azurerm_key_vault_secret.this["${secret.key_vault}/${secret.name}"].version
            content_type : data.azurerm_key_vault_secret.this["${secret.key_vault}/${secret.name}"].content_type
            tags : data.azurerm_key_vault_secret.this["${secret.key_vault}/${secret.name}"].tags
          }
        }
      }
    } if local.enabled
  ]...)
}

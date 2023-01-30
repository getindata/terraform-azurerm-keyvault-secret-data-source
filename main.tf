data "azurerm_key_vault_secret" "this" {
  for_each = local.enabled ? local.secrets : {}

  key_vault_id = each.value.key_vault_id
  name         = each.value.name
}

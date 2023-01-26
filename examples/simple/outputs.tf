output "key_vaults" {
  description = "Key vaults with retrieved objects"
  value       = module.key_vault_secret_data_source.key_vaults
  sensitive   = true
}

output "key_vault_a" {
  description = "Objects retrieved from key-vault-a"
  value       = module.key_vault_secret_data_source.key_vaults.key-vault-a
}

output "key_vault_a_secrets" {
  description = "Secrets retrieved from key-vault-a"
  value       = module.key_vault_secret_data_source.key_vaults.key-vault-a.secrets
  sensitive   = true
}

output "key_vault_a_secret_1" {
  description = "SECRET_1 value retrieved from key-vault-a"
  value       = module.key_vault_secret_data_source.key_vaults.key-vault-a.secrets.SECRET_1.value
  sensitive   = true
}

output "key_vault_b_secret_3" {
  description = "SECRET_3 value retrieved from key-vault-b"
  value       = module.key_vault_secret_data_source.key_vaults.key-vault-b.secrets.SECRET_3.value
  sensitive   = true
}

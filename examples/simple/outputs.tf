output "key_vaults" {
  description = "Key vaults with retrieved objects"
  value       = module.key_vault_secret_data_source.key_vaults
  sensitive   = true
}

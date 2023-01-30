output "key_vaults" {
  description = "Key vaults with retrieved objects"
  value       = local.key_vaults
  sensitive   = true
}

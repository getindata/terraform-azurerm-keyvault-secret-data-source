output "key_vaults" {
  description = "Key vaults with retrieved objects"
  value       = module.deepmerge.merged
  sensitive   = true
}

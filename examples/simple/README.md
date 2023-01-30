# Simple Example

```terraform
module "key_vault_data_source" {
  source = "../../"

  key_vaults = {
    key-vault-a: {
      key_vault_id: "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP>/providers/Microsoft.KeyVault/vaults/<KEY_VAULT_A_NAME>"
      secrets: ["SECRET_1", "SECRET_2"]
    }
    key-vault-b: {
      key_vault_id: "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RESOURCE_GROUP>/providers/Microsoft.KeyVault/vaults/<KEY_VAULT_B_NAME>"
      secrets: ["SECRET_3"]
    }
  }
}
```

## Usage

```
terraform init
terraform plan -out tfplan
terraform apply tfplan
```

After running above code secrets should be available as outputs, e.g. you can create output for only one secret from specific key vault:
```terraform
output "key_vault_a_secret_1" {
  description = "SECRET_1 value retrieved from key-vault-a"
  value       = module.key_vault_secret_data_source.key_vaults.key-vault-a.secrets.SECRET_1.value
  sensitive   = true
}
```

See more examples in [outputs.tf](outputs.tf)

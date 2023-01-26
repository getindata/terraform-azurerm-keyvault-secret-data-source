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

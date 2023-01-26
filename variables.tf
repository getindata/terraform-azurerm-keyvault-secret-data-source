variable "key_vaults" {
  description = "Specifies objects to retrieve from key vaults"
  type = map(object({
    key_vault_id = string
    secrets      = optional(set(string), [])
  }))
}

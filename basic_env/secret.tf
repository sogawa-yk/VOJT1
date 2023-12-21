data "oci_vault_secret" "ssh_public_key" {
  secret_id = var.secret_id
}

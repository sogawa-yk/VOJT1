module "test_instance1" {
  source              = "../../modules/compute/compute/live"
  compartment_id      = var.compartment_ocid
  shape               = var.shape
  source_id           = var.source_id
  source_type         = var.source_type
  display_name        = var.display_name_1
  subnet_id           = module.sample_network.public_subnet_id
  oci_ad_name         = data.oci_identity_availability_domains.ads.availability_domains[0].name
  ssh_authorized_keys = base64decode(data.oci_secrets_secretbundle.ssh_public_key.secret_bundle_content.0.content)
  server_port         = var.server_port
  plugins_configs = [
    {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    },
    {
      desired_state = "ENABLED"
      name          = "Bastion"
  }]
  assign_public_ip = false
}

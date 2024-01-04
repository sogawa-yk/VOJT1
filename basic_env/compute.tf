module "compute1" {
  source              = "../modules/compute/compute"
  compartment_ocid    = var.compartment_ocid
  oci_ad_name         = data.oci_identity_availability_domains.ads.availability_domains[0].name
  shape               = var.shape
  source_id           = var.source_id
  source_type         = var.source_type
  display_name        = var.display_name_compute1
  subnet_id           = module.sample_network.subnet_id
  ssh_authorized_keys = base64decode(data.oci_secrets_secretbundle.ssh_public_key.secret_bundle_content.0.content)
  server_port         = 80
}

# module "compute2" {
#   source              = "../modules/compute"
#   compartment_ocid    = var.compartment_ocid
#   oci_ad_name         = data.oci_identity_availability_domains.ads.availability_domains[0].name
#   shape               = var.shape
#   source_id           = var.source_id
#   source_type         = var.source_type
#   display_name        = var.display_name_compute2
#   subnet_id           = module.sample_network.subnet_id
#   ssh_authorized_keys = base64decode(data.oci_secrets_secretbundle.ssh_public_key.secret_bundle_content.0.content)
# }

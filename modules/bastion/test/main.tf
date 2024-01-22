module "test_bastion" {
  source                                                             = "../live"
  bastion_bastion_type                                               = var.bastion_bastion_type
  compartment_id                                                     = var.compartment_ocid
  bastion_client_cidr_block_allow_list                               = var.bastion_client_cidr_block_allow_list
  bastion_dns_proxy_status                                           = var.bastion_dns_proxy_status
  bastion_max_session_ttl_in_seconds                                 = var.bastion_max_session_ttl_in_seconds
  bastion_name                                                       = var.bastion_name
  session_target_resource_details_session_type                       = var.session_target_resource_details_session_type
  session_target_resource_details_target_resource_fqdn               = var.session_target_resource_details_target_resource_fqdn
  target_resource_operation_system_user_name                         = var.target_resource_operation_system_user_name
  session_target_resource_details_target_resource_port               = var.session_target_resource_details_target_resource_port
  session_target_resource_details_target_resource_private_ip_address = var.session_target_resource_details_target_resource_private_ip_address
  session_display_name                                               = var.session_display_name
  session_key_type                                                   = var.session_key_type
  session_session_ttl_in_seconds                                     = var.session_session_ttl_in_seconds
  test_target_resource_id                                            = module.test_instance.instance_id
  test_username                                                      = "opc"
}

module "test_instance" {
  source              = "../../compute/compute/live"
  compartment_id      = var.compartment_ocid
  shape               = var.shape
  source_id           = var.source_id
  source_type         = var.source_type
  display_name        = var.display_name
  subnet_id           = module.sample_network.public_subnet_id
  oci_ad_name         = data.oci_identity_availability_domains.ads.availability_domains[0].name
  ssh_authorized_keys = null
  server_port         = var.server_port
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

data "oci_core_services" "services" {
}

data "oci_secrets_secretbundle" "ssh_public_key" {
  secret_id = var.secret_id
}

module "sample_network" {
  source                             = "../../network/live"
  compartment_ocid                   = var.compartment_ocid
  vcn_cidr_block                     = var.vcn_cidr_block
  vcn_dns_label                      = var.vcn_dns_label
  vcn_display_name                   = var.vcn_display_name
  public_security_list_display_name  = var.public_security_list_display_name
  private_security_list_display_name = var.private_security_list_display_name
  public_subnet_cidr_block           = var.public_subnet_cidr_block
  private_subnet_cidr_block          = var.private_subnet_cidr_block
  public_subnet_display_name         = var.public_subnet_display_name
  private_subnet_display_name        = var.private_subnet_display_name
  internet_gateway_display_name      = var.internet_gateway_display_name
  route_table_display_name           = var.route_table_display_name
  service_gateway_display_name       = var.service_gateway_display_name
  service_id                         = data.oci_core_services.services.services.0.id
  nat_gateway_display_name           = var.nat_gateway_display_name
  load_balancer_enabled              = var.load_balancer_enabled
  load_balancer_display_name         = var.load_balancer_display_name
  backend_set_name                   = var.backend_set_name
  listener_name                      = var.listener_name
}

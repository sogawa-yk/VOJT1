module "test_instance" {
  source              = "../live"
  compartment_id      = var.compartment_ocid
  shape               = var.shape
  source_id           = var.source_id
  source_type         = var.source_type
  display_name        = var.display_name
  subnet_id           = module.sample_network.public_subnet_id
  oci_ad_name         = data.oci_identity_availability_domains.ads.availability_domains[0].name
  ssh_authorized_keys = var.ssh_authorized_keys
  server_port         = var.server_port
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

module "sample_network" {
  source                             = "../../../network/live"
  compartment_ocid                   = var.compartment_ocid
  vcn_cidr_block                     = "10.0.0.0/16"
  vcn_dns_label                      = "sample"
  vcn_display_name                   = "sample_vcn"
  public_security_list_display_name  = "pub_sample_security_list"
  private_security_list_display_name = "priv_sample_security_list"
  public_subnet_cidr_block           = "10.0.0.0/24"
  private_subnet_cidr_block          = "10.0.1.0/24"
  public_subnet_display_name         = "pub_sample_subnet"
  private_subnet_display_name        = "priv_sample_subnet"
  internet_gateway_display_name      = "sample_igw"
  route_table_display_name           = "sample_route_table"
  service_gateway_display_name       = "sample_SG"
  service_id                         = data.oci_core_services.services.services.0.id
  nat_gateway_display_name           = "sample_nat"
  load_balancer_enabled              = false
  load_balancer_display_name         = ""
  backend_set_name                   = ""
  listener_name                      = ""
}

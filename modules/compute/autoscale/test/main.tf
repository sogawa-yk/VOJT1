module "autoscale" {
  source                              = "../live"
  compartment_id                      = var.compartment_ocid
  instance_configuration_display_name = "instance_configuration_test"
  availability_domain                 = data.oci_identity_availability_domains.ads.availability_domains[0].name
  image_id                            = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasxeukiy4xr43xmxm2iymurikjbow7jeiil66eu66mxbqhy3rgp5a"
  metadata = { user_data : base64encode(<<-EOF
                              #cloud-config
                              package_update: true
                              package_upgrade: true
                              packages:
                                - nginx

                              runcmd:
                                - systemctl start nginx
                                - systemctl enable nginx

                              EOF
    )
    ssh_authorized_keys = base64decode(data.oci_secrets_secretbundle.ssh_public_key.secret_bundle_content.0.content)
  }
  shape                                  = "VM.Standard2.1"
  subnet_id                              = module.sample_network.public_subnet_id
  instance_pool_display_name             = "test"
  instance_pool_display_name_formatter   = "testtest"
  autoscaling_configuration_display_name = "test_AS"
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
  source                             = "../../../network"
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
}

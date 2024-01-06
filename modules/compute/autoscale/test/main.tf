module "autoscale" {
  source                              = "../live"
  compartment_id                      = var.compartment_ocid
  instance_configuration_display_name = "instance_configuration_test"
  availability_domain                 = data.oci_identity_availability_domains.ads.availability_domains[0].name
  image_id                            = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasxeukiy4xr43xmxm2iymurikjbow7jeiil66eu66mxbqhy3rgp5a"
  metadata = { user_data : base64encode(<<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 80 &
                EOF
  ) }
  shape                                  = "VM.Standard.A1.Flex"
  subnet_id                              = module.sample_network.subnet_id
  instance_pool_display_name             = "test"
  instance_pool_display_name_formatter   = "testtest"
  instance_pool_size                     = 2
  autoscaling_configuration_display_name = "test_AS"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

data "oci_core_services" "services" {
}

module "sample_network" {
  source                        = "../../../network"
  compartment_ocid              = var.compartment_ocid
  security_list_display_name    = "sample_security_list" #var.security_list_display_name
  subnet_cidr_block             = "10.0.0.0/16"          #var.subnet_cidr_block
  subnet_display_name           = "sample_subnet"        #var.subent_display_name
  vcn_cidr_block                = "10.0.0.0/16"          #var.vcn_cidr_block
  vcn_dns_label                 = "sample"               #var.vcn_dns_label
  vcn_display_name              = "sample_vcn"           #var.vcn_display_name
  internet_gateway_display_name = "sample_igw"           #var.internet_gateway_display_name
  route_table_display_name      = "sample_route_table"   #var.route_table_display_name
  service_gateway_display_name  = "sample_SG"
  service_id                    = data.oci_core_services.services.services.0.id
}

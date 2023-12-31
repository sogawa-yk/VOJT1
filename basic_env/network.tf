module "sample_network" {
  source                        = "../modules/network"
  compartment_ocid              = var.compartment_ocid
  security_list_display_name    = "sample_security_list" #var.security_list_display_name
  subnet_cidr_block             = "10.0.0.0/16"          #var.subnet_cidr_block
  subnet_display_name           = "sample_subnet"        #var.subent_display_name
  vcn_cidr_block                = "10.0.0.0/16"          #var.vcn_cidr_block
  vcn_dns_label                 = "sample"               #var.vcn_dns_label
  vcn_display_name              = "sample_vcn"           #var.vcn_display_name
  internet_gateway_display_name = "sample_igw"           #var.internet_gateway_display_name
  route_table_display_name      = "sample_route_table"   #var.route_table_display_name
  service_gateway_display_name  = var.service_gateway_display_name
}

resource "oci_core_vcn" "vcn" {
  #Required
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr_block
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
}

resource "oci_core_internet_gateway" "internet_gateway" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  #Optional
  display_name = var.internet_gateway_display_name
}

resource "oci_core_service_gateway" "service_gateway" {
  #Required
  compartment_id = var.compartment_ocid
  services {
    #Required
    service_id = var.service_id
  }
  vcn_id = oci_core_vcn.vcn.id

  #Optional
  display_name = var.service_gateway_display_name
}

resource "oci_core_nat_gateway" "nat_gateway" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  #Optional
  display_name = var.nat_gateway_display_name
}



resource "oci_core_route_table" "public_route_table" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  #Optional
  display_name = var.route_table_display_name
  route_rules {
    #Required
    network_entity_id = oci_core_internet_gateway.internet_gateway.id

    #Optional
    description      = "sample"     #var.route_table_route_rules_description
    destination      = "0.0.0.0/0"  #var.route_table_route_rules_destination
    destination_type = "CIDR_BLOCK" #var.route_table_route_rules_destination_type
  }
}

resource "oci_core_route_table" "private_route_table" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  #Optional
  display_name = var.route_table_display_name
  route_rules {
    #Required
    network_entity_id = oci_core_nat_gateway.nat_gateway.id

    #Optional
    description      = "sample"     #var.route_table_route_rules_description
    destination      = "0.0.0.0/0"  #var.route_table_route_rules_destination
    destination_type = "CIDR_BLOCK" #var.route_table_route_rules_destination_type
  }
}

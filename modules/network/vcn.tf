resource "oci_core_vcn" "vcn" {
  #Required
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr_block
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
  freeform_tags  = { "Department" = "Finance" }
}

resource "oci_core_internet_gateway" "test_internet_gateway" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.test_vcn.id

  #Optional
  display_name   = var.internet_gateway_display_name
  route_table_id = oci_core_route_table.test_route_table.id
}

resource "oci_core_route_table" "route_table" {
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.test_vcn.id

  #Optional
  display_name = var.route_table_display_name
  route_rules {
    #Required
    network_entity_id = oci_core_internet_gateway.test_internet_gateway.id

    #Optional
    # cidr_block = var.route_table_route_rules_cidr_block
    # description = var.route_table_route_rules_description
    # destination = var.route_table_route_rules_destination
    # destination_type = var.route_table_route_rules_destination_type
  }
}

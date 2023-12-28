resource "oci_core_subnet" "subnet" {

  # Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  cidr_block     = var.subnet_cidr_block

  # Optional
  # Caution: For the route table id, use module.vcn.nat_route_id.
  # Do not use module.vcn.nat_gateway_id, because it is the OCID for the gateway and not the route table.
  route_table_id    = oci_core_route_table.route_table.id
  security_list_ids = [oci_core_security_list.security-list.id]
  display_name      = var.subnet_display_name
}
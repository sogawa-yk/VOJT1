output "vcn_id" {
  value = oci_core_vcn.vcn
}

output "route_table_id" {
  value = oci_core_route_table.route_table
}

output "subnet_id" {
  value = oci_core_subnet.subnet.id
}

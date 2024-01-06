output "vcn_id" {
  value = oci_core_vcn.vcn
}

output "route_table_id" {
  value = oci_core_route_table.route_table
}

output "public_subnet_id" {
  value = oci_core_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = oci_core_subnet.private_subnet.id
}

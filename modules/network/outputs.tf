output "vcn_id" {
  value = oci_core_vcn.vcn
}

output "public_route_table_id" {
  value = oci_core_route_table.public_route_table
}

output "private_route_table_id" {
  value = oci_core_route_table.private_route_table
}

output "public_subnet_id" {
  value = oci_core_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = oci_core_subnet.private_subnet.id
}

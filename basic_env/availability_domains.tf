data "oci_identity_availability_domains" "abs" {
    compartment_id = var.compartment_ocid
}
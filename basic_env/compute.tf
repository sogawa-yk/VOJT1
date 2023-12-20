module "compute1" {
    source = "../modules/compute"
    compartment_ocid = var.compartment_ocid
    oci_ad_name = oci_identity_availability_domains[0].name
    shape = var.shape
    source_id = var.source_id
    source_type = var.source_type
    display_name = var.display_name_compute1
    subnet_id = oci_core_subnet.vcn-public-subnet.id
}

module "compute2" {
    source = "../modules/compute"
    compartment_ocid = var.compartment_ocid
    oci_ad_name = oci_identity_availability_domains[0].name
    shape = var.shape
    source_id = var.source_id
    source_type = var.source_type
    display_name = var.display_name_compute2
    subnet_id = oci_core_subnet.vcn-public-subnet.id
}
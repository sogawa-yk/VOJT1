module "ubuntu_instance" {
    source = "../modules/compute"
    compartment_id = var.compartment_id
    shape = var.shape
    source_id = var.source_id
    source_type = var.source_type
    display_name = var.display_name_compute1
    subnet_id = oci_core_subnet.vcn-public-subnet.id
}

module "ubuntu_instance" {
    source = "../modules/compute"
    compartment_id = var.compartment_id
    shape = var.shape
    source_id = var.source_id
    source_type = var.source_type
    display_name = var.display_name_compute2
    subnet_id = oci_core_subnet.vcn-public-subnet.id
}
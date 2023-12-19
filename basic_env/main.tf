module "vcn" {
    source  = "oracle-terraform-modules/vcn/oci"
    version = "3.6.0"
    # insert the 1 required variable here
    compartment_id = var.compartment_id

    vcn_name = var.vcn_name
    vcn_dns_label = var.vcn_dns_label
    vcn_cidrs = [var.vcn_cidr] # This value is default

    create_internet_gateway = true
    create_nat_gateway = true
    create_service_gateway = true
}

module "compute1" {
    source = "./modules/compute"
    compartment_id = var.compartment_id
    shape = var.shape
    source_id = var.source_id
    source_type = var.source_type
    display_name = var.display_name
    subnet_id = var.subnet_id

}

module "compute2" {
    source = "./modules/compute"
    compartment_id = var.compartment_id
    shape = var.shape
    source_id = var.source_id
    source_type = var.source_type
    display_name = var.display_name
    subnet_id = var.subnet_id
    
}
module "vcn" {
    source  = "oracle-terraform-modules/vcn/oci"
    version = "3.6.0"
    # insert the 1 required variable here
    compartment_id = var.compartment_id

    vcn_name = var.vcn_name
    vcn_dns_label = var.vcn_dns_label
    vcn_cidrs = ["10.0.0.0/16"] # This value is default

    create_internet_gateway = true
    create_nat_gateway = true
    create_service_gateway = true
}

resource "oci_core_subnet" "vcn-public-subnet"{

    # Required
    compartment_id = var.compartment_id
    vcn_id = module.vcn.vcn_id
    cidr_block = "10.0.0.0/24"

    # Optional
    route_table_id = module.vcn.ig_route_id
    security_list_ids = [oci_core_security_list.public-security-list.id]
    display_name = "public-subnet"
}

resource "oci_core_subnet" "vcn-private-subnet"{

    # Required
    compartment_id = var.compartment_id
    vcn_id = module.vcn.vcn_id
    cidr_block = "10.0.1.0/24"

    # Optional
    # Caution: For the route table id, use module.vcn.nat_route_id.
    # Do not use module.vcn.nat_gateway_id, because it is the OCID for the gateway and not the route table.
    route_table_id = module.vcn.nat_route_id
    security_list_ids = [oci_core_security_list.private-security-list.id]
    display_name = "private-subnet"
}
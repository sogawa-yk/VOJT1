module "vcn" {
    source  = "oracle-terraform-modules/vcn/oci"
    version = "3.6.0"
    # insert the 1 required variable here
    compartment_id = var.compartment_ocid

    vcn_name = var.vcn_name
    vcn_dns_label = var.vcn_dns_label
    vcn_cidrs = ["10.0.0.0/16"] # This value is default

    create_internet_gateway = true
    create_nat_gateway = true
    create_service_gateway = true
}

resource "oci_core_subnet" "vcn-public-subnet"{

    # Required
    compartment_id = var.compartment_ocid
    vcn_id = module.vcn.vcn_id
    cidr_block = "10.0.0.0/24"

    # Optional
    route_table_id = module.vcn.ig_route_id
    security_list_ids = [oci_core_security_list.public-security-list.id]
    display_name = "public-subnet"
}

resource "oci_core_subnet" "vcn-private-subnet"{

    # Required
    compartment_id = var.compartment_ocid
    vcn_id = module.vcn.vcn_id
    cidr_block = "10.0.1.0/24"

    # Optional
    # Caution: For the route table id, use module.vcn.nat_route_id.
    # Do not use module.vcn.nat_gateway_id, because it is the OCID for the gateway and not the route table.
    route_table_id = module.vcn.nat_route_id
    security_list_ids = [oci_core_security_list.private-security-list.id]
    display_name = "private-subnet"
}

resource "oci_core_security_list" "public-security-list"{

    # Required
    compartment_id = "ocid1.compartment.oc1..aaaaaaaanxm4oucgt5pkgd7sw2vouvckvvxan7ca2lirowaao7krnzlkdkhq"
    vcn_id = module.vcn.vcn_id

    # Optional
    display_name = "security-list-for-public-subnet"

    egress_security_rules {
        stateless = false
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all" 
    }
    
    ingress_security_rules { 
        stateless = false
        source = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
        protocol = "6"
        tcp_options { 
            min = 22
            max = 22
        }
    }
    ingress_security_rules { 
        stateless = false
        source = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
        protocol = "1"

        # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
        icmp_options {
        type = 3
        code = 4
        } 
    }   

    ingress_security_rules { 
        stateless = false
        source = "10.0.0.0/16"
        source_type = "CIDR_BLOCK"
        # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
        protocol = "1"

        # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
        icmp_options {
        type = 3
        } 
    }

}

# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "private-security-list"{

    # Required
    compartment_id = "ocid1.compartment.oc1..aaaaaaaanxm4oucgt5pkgd7sw2vouvckvvxan7ca2lirowaao7krnzlkdkhq"
    vcn_id = module.vcn.vcn_id

    # Optional
    display_name = "security-list-for-private-subnet"

    egress_security_rules {
        stateless = false
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all" 
    }
    
    ingress_security_rules { 
        stateless = false
        source = "10.0.0.0/16"
        source_type = "CIDR_BLOCK"
        # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
        protocol = "6"
        tcp_options { 
            min = 22
            max = 22
        }
    }
    ingress_security_rules { 
        stateless = false
        source = "0.0.0.0/0"
        source_type = "CIDR_BLOCK"
        # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
        protocol = "1"

        # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
        icmp_options {
        type = 3
        code = 4
        } 
    }   

    ingress_security_rules { 
        stateless = false
        source = "10.0.0.0/16"
        source_type = "CIDR_BLOCK"
        # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
        protocol = "1"

        # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
        icmp_options {
        type = 3
        } 
    }

}
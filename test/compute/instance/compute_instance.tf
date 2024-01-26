module "instance" {
  source         = "../../../modules/compute/instance"
  compartment_id = var.compartment_ocid
  instances      = local.updated_instances
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

locals {
  updated_instances = {
    for key, instance in var.instances : key => {
      availability_domain = data.oci_identity_availability_domains.abs.availability_domains[0].name
      fault_domain        = intance.fault_domain
      display_name        = instance.display_name
      shape               = instance.shape
      source_details      = instance.source_details
      create_vnic_details = instance.create_vnic_details
      shape_config        = instance.shape_config
      plugins_config      = instance.plugins_config
      metadata            = instance.metadata
    }
  }
}

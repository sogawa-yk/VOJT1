resource "oci_core_instance_configuration" "test_instance_configuration" {
  #Required
  compartment_id = var.compartment_ocid

  #Optional
  defined_tags  = { "Operations.CostCenter" = "42" }
  display_name  = var.instance_configuration_display_name
  freeform_tags = { "Department" = "Finance" }
  instance_details {
    #Required
    instance_type = "compute"

    #Optional
    launch_details {

      #Optional
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      compartment_id      = var.compartment_ocid
      create_vnic_details {

        #Optional
        assign_public_ip = true
        defined_tags     = { "Operations.CostCenter" = "42" }
        subnet_id        = module.vcn.subnet_id
      }
      defined_tags = { "Operations.CostCenter" = "42" }
      # display_name = var.display_name
      # fault_domain = var.fault_domain # 指定しない場合はシステムが自動で設定する
      launch_mode = "NATIVE"
      metadata    = var.metadata
      shape       = var.shape
    }

  }
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.6.0"
  # insert the 1 required variable here
  compartment_id = var.compartment_ocid
}

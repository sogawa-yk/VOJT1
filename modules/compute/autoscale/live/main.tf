resource "oci_core_instance_configuration" "test_instance_configuration" {
  #Required
  compartment_id = var.compartment_id

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
      availability_domain = var.availability_domain
      compartment_id      = var.compartment_id
      create_vnic_details {

        #Optional
        assign_public_ip = true
        defined_tags     = { "Operations.CostCenter" = "42" }
        subnet_id        = var.subnet_id
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

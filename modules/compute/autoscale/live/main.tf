resource "oci_core_instance_configuration" "test_instance_configuration" {
  #Required
  compartment_id = var.compartment_id

  #Optional
  display_name  = var.instance_configuration_display_name
  freeform_tags = { "Department" = "Finance" }
  instance_details {
    #Required
    instance_type = "compute"

    #Optional
    launch_details {
      source_details {
        # 以下はイメージを使用してインスタンスを起動する例
        source_type = "image"
        image_id    = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasxeukiy4xr43xmxm2iymurikjbow7jeiil66eu66mxbqhy3rgp5a"
      }
      #Optional
      availability_domain = var.availability_domain
      compartment_id      = var.compartment_id
      create_vnic_details {

        #Optional
        assign_public_ip = true
        subnet_id        = var.subnet_id
      }
      # display_name = var.display_name
      # fault_domain = var.fault_domain # 指定しない場合はシステムが自動で設定する
      launch_mode = "NATIVE"
      metadata    = var.metadata
      shape       = var.shape
    }

  }
}


resource "oci_core_instance_pool" "test_instance_pool" {
  #Required
  compartment_id            = var.compartment_id
  instance_configuration_id = oci_core_instance_configuration.test_instance_configuration.id
  placement_configurations {
    #Required
    availability_domain = var.availability_domain
    # primary_vnic_subnets {
    #   subnet_id = var.subnet_id
    # }
  }
  size = var.instance_pool_size

  #Optional
  display_name                    = var.instance_pool_display_name
  instance_display_name_formatter = var.instance_pool_display_name_formatter
  # load_balancers {
  #   #Required
  #   backend_set_name = oci_load_balancer_backend_set.test_backend_set.name
  #   load_balancer_id = oci_load_balancer_load_balancer.test_load_balancer.id
  #   port             = var.instance_pool_load_balancers_port
  #   vnic_selection   = var.instance_pool_load_balancers_vnic_selection
  # }
}

resource "oci_core_instance" "sample_instance" {
  # Required
  availability_domain = var.oci_ad_name
  compartment_id      = var.compartment_id
  shape               = var.shape
  source_details {
    source_id   = var.source_id
    source_type = "image"
  }

  # Optional
  display_name = var.display_name
  create_vnic_details {
    assign_public_ip = var.assign_public_ip
    subnet_id        = var.subnet_id
  }
  shape_config {
    #Flexシェイプの時に必要
    #Optional
    baseline_ocpu_utilization = "BASELINE_1_1"
    memory_in_gbs             = 16
    ocpus                     = 2
  }
  agent_config {
    dynamic "plugins_config" {
      for_each = var.plugins_configs

      content {
        name          = plugins_config.value.name
        desired_state = plugins_config.value.desired_state
      }
    }
  }
  metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
    user_data = base64encode(<<-EOF
                            #cloud-config
                            package_update: true
                            package_upgrade: true
                            packages:
                                - nginx
                                - iptables-persistent

                            runcmd:
                            - iptables -I INPUT 5 -p tcp --dport 80 -j ACCEPT
                            - netfilter-persistent save
                            - systemctl start nginx
                            - systemctl enable nginx

                            EOF
    )
  }
  preserve_boot_volume = false
}

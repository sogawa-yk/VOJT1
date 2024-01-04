resource "oci_core_instance" "ubuntu_instance" {
  # Required
  availability_domain = var.oci_ad_name
  compartment_id      = var.compartment_ocid
  shape               = var.shape
  source_details {
    source_id   = var.source_id
    source_type = "image"
  }

  # Optional
  display_name = var.display_name
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = var.subnet_id
  }
  metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF
  }
  preserve_boot_volume = false
}

module "instance_configuration" {
  source                              = "../live"
  compartment_id                      = var.compartment_ocid
  instance_configuration_display_name = var.instance_configuration_display_name
  availability_domain                 = data.oci_identity_availability_domains.ads.availability_domains[0].name
  metadata = { user_data : base64encode(<<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 80 &
                EOF
  ) }
  shape     = "VM.Standard2.1"
  subnet_id = module.vcn.subnet_id
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

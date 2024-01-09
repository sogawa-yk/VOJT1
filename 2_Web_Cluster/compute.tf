module "autoscale" {
  source                              = "../modules/compute/autoscale/live"
  compartment_id                      = var.compartment_ocid
  instance_configuration_display_name = "instance_configuration_test"
  availability_domain                 = data.oci_identity_availability_domains.ads.availability_domains[0].name
  image_id                            = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasxeukiy4xr43xmxm2iymurikjbow7jeiil66eu66mxbqhy3rgp5a"
  metadata = { user_data : base64encode(<<-EOF
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
    ssh_authorized_keys = base64decode(data.oci_secrets_secretbundle.ssh_public_key.secret_bundle_content.0.content)
  }
  shape                                  = "VM.Standard2.1"
  subnet_id                              = module.sample_network.private_subnet_id
  instance_pool_display_name             = "test"
  instance_pool_display_name_formatter   = "testtest"
  autoscaling_configuration_display_name = "test_AS"
  load_balancer_enabled                  = true
  load_balancer_id                       = module.sample_network.load_balancer_id
  backend_set_name                       = module.sample_network.load_balancer_backend_set_name
}

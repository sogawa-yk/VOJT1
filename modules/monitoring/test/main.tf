module "test_monitoring" {
  source                                              = "../live"
  compartment_id                                      = var.compartment_ocid
  alarm_display_name                                  = var.alarm_display_name
  alarm_is_enabled                                    = var.alarm_is_enabled
  alarm_metric_compartment_id                         = var.compartment_ocid
  alarm_namespace                                     = var.alarm_namespace
  alarm_query                                         = var.alarm_query
  alarm_severity                                      = var.alarm_severity
  alarm_body                                          = var.alarm_body
  alarm_is_notifications_per_metric_dimension_enabled = var.alarm_is_notifications_per_metric_dimension_enabled
  alarm_message_format                                = var.alarm_message_format
  alarm_metric_compartment_id_in_subtree              = var.alarm_metric_compartment_id_in_subtree
  alarm_pending_duration                              = var.alarm_pending_duration
  alarm_repeat_notification_duration                  = var.alarm_repeat_notification_duration
  alarm_resolution                                    = var.alarm_resolution
  alarm_resource_group                                = var.alarm_resource_group
  alarm_suppression_time_suppress_from                = var.alarm_suppression_time_suppress_from
  alarm_suppression_time_suppress_until               = var.alarm_suppression_time_suppress_until
  alarm_suppression_description                       = var.alarm_suppression_description
  notification_topic_description                      = var.notification_topic_description
}

module "test_instance" {
  source              = "../../compute/compute/live"
  compartment_id      = var.compartment_ocid
  shape               = var.shape
  source_id           = var.source_id
  source_type         = var.source_type
  display_name        = var.display_name
  subnet_id           = module.sample_network.public_subnet_id
  oci_ad_name         = data.oci_identity_availability_domains.ads.availability_domains[0].name
  ssh_authorized_keys = base64decode(data.oci_secrets_secretbundle.ssh_public_key.secret_bundle_content.0.content)
  server_port         = var.server_port
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

data "oci_core_services" "services" {
}

data "oci_secrets_secretbundle" "ssh_public_key" {
  secret_id = var.secret_id
}

module "sample_network" {
  source                             = "../../../network/live"
  compartment_ocid                   = var.compartment_ocid
  vcn_cidr_block                     = "10.0.0.0/16"
  vcn_dns_label                      = "sample"
  vcn_display_name                   = "sample_vcn"
  public_security_list_display_name  = "pub_sample_security_list"
  private_security_list_display_name = "priv_sample_security_list"
  public_subnet_cidr_block           = "10.0.0.0/24"
  private_subnet_cidr_block          = "10.0.1.0/24"
  public_subnet_display_name         = "pub_sample_subnet"
  private_subnet_display_name        = "priv_sample_subnet"
  internet_gateway_display_name      = "sample_igw"
  route_table_display_name           = "sample_route_table"
  service_gateway_display_name       = "sample_SG"
  service_id                         = data.oci_core_services.services.services.0.id
  nat_gateway_display_name           = "sample_nat"
  load_balancer_enabled              = false
  load_balancer_display_name         = ""
  backend_set_name                   = ""
  listener_name                      = ""
}

### MONITORING #######################################

### REFERENCE ########################################
### https://github.com/oracle/terraform-provider-oci/blob/master/examples/monitoring/alarms/alarms.tf
######################################################
alarm_display_name                                  = "test_alarm"
alarm_is_enabled                                    = true
alarm_namespace                                     = "oci_computeagent"
alarm_query                                         = "CpuUtilization[10m].percentile(0.9) < 85"
alarm_severity                                      = "WARNING"
alarm_body                                          = "High CPU utilization reached"
alarm_is_notifications_per_metric_dimension_enabled = false
alarm_message_format                                = "ONS_OPTIMIZED"
alarm_metric_compartment_id_in_subtree              = false
alarm_pending_duration                              = "PT5M"
alarm_repeat_notification_duration                  = "PT2H"
alarm_resolution                                    = "1m"
alarm_resource_group                                = null
alarm_suppression_time_suppress_from                = "2025-01-17T19:00:00.000Z"
alarm_suppression_time_suppress_until               = "2025-01-18T19:00:00.000Z"
alarm_suppression_description                       = "suppression test"
notification_topic_name                             = "test_topic"
notification_topic_description                      = "this topic is for test"
subscription_protocol                               = "EMAIL"

### COMPUTE ###########################################
shape          = "VM.Standard2.1"
source_id      = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasxeukiy4xr43xmxm2iymurikjbow7jeiil66eu66mxbqhy3rgp5a"
source_type    = "image"
display_name_1 = "test_instance_1"
display_name_2 = "test_instance_2"
server_port    = 80

### NETWORK ###########################################
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
nat_gateway_display_name           = "sample_nat"
load_balancer_enabled              = false
load_balancer_display_name         = null
backend_set_name                   = null
listener_name                      = null

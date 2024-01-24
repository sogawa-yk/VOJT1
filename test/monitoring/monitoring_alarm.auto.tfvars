monitoring_alarms = {
  "alarm001" = {
    destinations                                  = module.oci_ons_notification_topic.notification_topic.topic_id
    display_name                                  = "alarm001"
    is_enabled                                    = true
    metric_compartment_id                         = var.compartment_ocid
    namespace                                     = "oci_computeagent"
    query                                         = "CpuUtilization[10m].percentile(0.9) < 85"
    severity                                      = "WARNING"
    body                                          = "High CPU utilization reached"
    is_notifications_per_metric_dimension_enabled = false
    message_format                                = "ONS_OPTIMIZED"
    metric_compartment_id_in_subtree              = false
    pending_duration                              = "PT5M"
    repeat_notification_duration                  = "PT2H"
    resolution                                    = "1m"
    resource_group                                = null
    suppression = {
      time_suppress_from  = "2025-01-17T19:00:00.000Z"
      time_suppress_until = "2025-01-18T19:00:00.000Z"
      description         = "suppression test001"
    }
  }
}

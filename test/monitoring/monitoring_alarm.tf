module "monitoring_alarm" {
  source            = "../../modules/monitoring/alarm"
  compartment_id    = var.compartment_ocid
  monitoring_alarms = local.updated_monitoring_alarms
}

locals {
  updated_monitoring_alarms = {
    for key, alarm in var.monitoring_alarms : key => {
      destinations          = [local.topic_map["topic001"]]
      metric_compartment_id = var.compartment_ocid
    }
  }
}
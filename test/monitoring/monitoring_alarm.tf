module "monitoring_alarm" {
  source            = "../../modules/monitoring/alarm"
  compartment_id    = var.compartment_ocid
  monitoring_alarms = var.monitoring_alarms
}

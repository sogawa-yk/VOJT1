module "subscription" {
  source         = "../../modules/monitoring/subscription"
  compartment_id = var.compartment_ocid
  subscriptions  = var.subscriptions
}

module "subscription" {
  source         = "../../modules/monitoring/subscription"
  compartment_id = var.compartment_ocid
  subscriptions  = local.updated_subscriptions
}

locals {
  updated_subscriptions = {
    for key, sub in var.subscriptions : key => {
      protocol = sub.protocol
      endpoint = sub.endpoint
      topic_id = module.oci_ons_notification_topic.notification_topic.topic_map["topic001"]
    }
  }
}


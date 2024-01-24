subscriptions = {
  "subscription001" = {
    endpoint = ""
    protocol = "EMAIL"
    topic_id = module.oci_ons_notification_topic.notification_topic.topic_id
  }
}

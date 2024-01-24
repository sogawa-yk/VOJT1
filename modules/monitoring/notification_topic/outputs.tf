output "topic_id" {
  description = "ID of Notification topic"
  value       = [for v in oci_ons_notification_topic : v.id]
}

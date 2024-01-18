variable "compartment_id" {}
variable "alarm_display_name" {}
variable "alarm_is_enabled" {}
variable "alarm_metric_compartment_id" {}
variable "alarm_namespace" {}
variable "alarm_query" {}
variable "alarm_severity" {}
variable "alarm_body" {}
variable "alarm_is_notifications_per_metric_dimension_enabled" {}
variable "alarm_message_format" {}
variable "alarm_metric_compartment_id_in_subtree" {
  default = false
}
variable "alarm_pending_duration" {}
variable "alarm_repeat_notification_duration" {}
variable "alarm_resolution" {}
variable "alarm_resource_group" {}
variable "alarm_suppression_time_suppress_from" {}
variable "alarm_suppression_time_suppress_until" {}
variable "alarm_suppression_description" {}

variable "notification_topic_name" {}
variable "notification_topic_description" {}

variable "subscription_endpoint" {}
variable "subscription_protocol" {}

variable "compartment_ocid" {}
variable "alarm_display_name" {
  description = "アラームの表示名"
}
variable "alarm_is_enabled" {
  description = "アラームを有効にするかどうか"
}
variable "alarm_metric_compartment_id" {
  description = "監視対象（メトリック）があるOCID"
}
variable "alarm_namespace" {
  description = "アラームのネームスペース。computeagentなど。"
}
variable "alarm_query" {
  description = "アラーム発火条件を定義するMQL(Monitoring Query Language)式"
}
variable "alarm_severity" {
  description = "アラームの重要度を定義する（CRITICALなど）"
}
variable "alarm_body" {
  description = "アラームの内容（人間が読める説明）"
}
variable "alarm_is_notifications_per_metric_dimension_enabled" {
  description = "trueにすると、メトリックストリームごとにアラームを通知"
}
variable "alarm_message_format" {}
variable "alarm_metric_compartment_id_in_subtree" {
  description = "監視範囲をすべてのコンパートメントとサブコンパートメントまでするか。アラームの場所がルートコンパートメントしか無理。"
}
variable "alarm_pending_duration" {
  description = "アラームを発火させるのに、何秒閾値を超える必要があるか"
}
variable "alarm_repeat_notification_duration" {
  description = "アラームが発火し続けている場合に、どれくらいの時間おきに通知するか。"
}
variable "alarm_resolution" {
  description = "アラームの閾値を判断するための解像度。ウィンドウサイズを定めて、そのウィンドウ内でメトリックを計算する（平均など）"
}
variable "alarm_resource_group" {}
variable "alarm_suppression_time_suppress_from" {
  description = "アラームを無効化する開始時刻"
}
variable "alarm_suppression_time_suppress_until" {
  description = "アラームを無効化する終了時刻"
}
variable "alarm_suppression_description" {
  description = "アラーム無効化の説明"
}
variable "notification_topic_name" {
  description = "通知サービスのトピックの名前"
}
variable "notification_topic_description" {
  description = "通知サービスのトピックの説明"
}

variable "subscription_endpoint" {
  description = "通知する先。プロトコルをEMAILにした場合はメールアドレス。"
}
variable "subscription_protocol" {
  description = "通知の際のプロトコル。"
}

### COMPUTE ###################################################
variable "shape" {}
variable "source_id" {}
variable "source_type" {}
variable "display_name_1" {}
variable "display_name_2" {}
variable "server_port" {}
variable "secret_id" {}

### NETWORK ###################################################
variable "vcn_cidr_block" {}
variable "vcn_dns_labels" {}
variable "vcn_display_name" {}
variable "public_security_list_display_name" {}
variable "private_security_list_display_name" {}
variable "public_subnet_cidr_block" {}
variable "private_subnet_cidr_block" {}
variable "public_subnet_display_name" {}
variable "private_subnet_display_name" {}
variable "internet_gateway_display_name" {}
variable "route_table_display_name" {}
variable "service_gateway_display_name" {}
variable "nat_gateway_display_name" {}
variable "load_balancer_enabled" {}
variable "load_balancer_display_name" {}
variable "backend_set_name" {}
variable "listener_name" {}

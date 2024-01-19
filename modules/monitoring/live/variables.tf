variable "compartment_id" {}
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
variable "alarm_message_format" {
  description = "アラーム通知のフォーマット。<RAW>, <PRETTY_JSON>, <ONS_OPTIMIZED>から選択"
}
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
variable "alarm_resource_group" {
  description = "メトリックを取得したいリソースグループを指定する。ここで指定したリソースグループに属するリソースを監視し、アラートを発生させる。"
}
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

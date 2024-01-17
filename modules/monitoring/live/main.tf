resource "oci_monitoring_alarm" "test_alarm" {
  #Required
  compartment_id        = var.compartment_id
  destinations          = [oci_ons_notification_topic.test_notification_topic.id] # アラーム通知先リスト
  display_name          = var.alarm_display_name
  is_enabled            = var.alarm_is_enabled
  metric_compartment_id = var.alarm_metric_compartment_id
  namespace             = var.alarm_namespace
  query                 = var.alarm_query    # アラーム発火条件を定義するMQL(Monitoring Query Language)式
  severity              = var.alarm_severity # アラームの重要度を定義する（CRITICALなど）

  #Optional
  body                                          = var.alarm_body # アラームの内容（人間が読める説明）
  defined_tags                                  = { "Operations.CostCenter" = "42" }
  freeform_tags                                 = { "Department" = "Finance" }
  is_notifications_per_metric_dimension_enabled = var.alarm_is_notifications_per_metric_dimension_enabled # trueにすると、メトリックストリームごとにアラームを通知
  message_format                                = var.alarm_message_format
  metric_compartment_id_in_subtree              = var.alarm_metric_compartment_id_in_subtree # 監視範囲をすべてのコンパートメントとサブコンパートメントまでするか。アラームの場所がルートコンパートメントしか無理
  pending_duration                              = var.alarm_pending_duration                 # アラームを発火させるのに、何秒閾値を超える必要があるか
  repeat_notification_duration                  = var.alarm_repeat_notification_duration     # アラームが発火し続けている場合に、どれくらいの時間おきに通知するか。専用のフォーマットあり（PT2Hの場合２時間おき）
  resolution                                    = var.alarm_resolution                       # アラームの閾値を判断するための解像度。ウィンドウサイズを定めて、そのウィンドウ内でメトリックを計算する（平均など）
  resource_group                                = var.alarm_resource_group
  suppression { # アラートを特定の条件下で無効化する
    #Required
    time_suppress_from  = var.alarm_suppression_time_suppress_from  # 抑制開始時間
    time_suppress_until = var.alarm_suppression_time_suppress_until # 抑制終了時間

    #Optional
    description = var.alarm_suppression_description # 説明
  }
}

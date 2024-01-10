resource "oci_logging_log" "Bucket_log" {
  #Required
  display_name = var.log_display_name
  log_group_id = oci_logging_log_group.ObjectStorage_log_group.id
  log_type     = "service"
  #Optional
  configuration {
    #Required
    source {
      #Required
      category    = "write"
      resource    = var.log_configuration_source_resource
      service     = "objectstorage"
      source_type = "OCISERVICE"
    }

    #Optional
    compartment_id = var.compartment_id
  }
  # is_enabled         = var.log_is_enabled
  # retention_duration = var.log_retention_duration
}

resource "oci_logging_log_group" "ObjectStorage_log_group" {
  #Required
  compartment_id = var.compartment_id
  display_name   = var.log_group_display_name
}

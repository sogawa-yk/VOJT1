module "adb" {
  source                      = "../modules/database"
  compartment_ocid            = var.compartment_ocid
  autonomous_database_db_name = "adb1"
}

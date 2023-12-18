variable "compartment_ocid" {}
variable "region" {}
variable "bucket_name" {
  default = "resource_manager_demo_bucket"
}

provider "oci" {
  region = var.region
}

data "oci_objectstorage_namespace" "namespace" {
  compartment_id = var.compartment_ocid
}

resource "oci_objectstorage_bucket" "create_bucket" {
  # required
  compartment_id = var.compartment_ocid
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.namespace.namespace

  # optional
  access_type = "NoPublicAccess" # <---- プライベートバケット
}

output "new_bucket" {
  value = oci_objectstorage_bucket.create_bucket
}
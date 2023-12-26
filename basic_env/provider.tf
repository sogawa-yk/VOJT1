terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.23.0"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  region       = var.region
  auth         = "InstancePrincipal"
}

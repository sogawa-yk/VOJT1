variable "region" {
    type = string
    default = "ca-toronto-1"
}
variable "user_ocid" {}
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "secret_id" {}
variable "vcn_name" {
    type = string
    default = "sample"
}
variable "vcn_dns_label" {
    type = string
    default = "sample"
}

########
variable "shape" {
    description = "The shape of compute instance"
    type = string
    default = "VM.Standard2.1"
}
variable "source_id" {
    description = "Source id of OS image"
    type = string
    default = "ocid1.image.oc1.ca-toronto-1.aaaaaaaasxeukiy4xr43xmxm2iymurikjbow7jeiil66eu66mxbqhy3rgp5a"
}
variable "source_type" {
    description = "source type"
    type = string
    default = "image"
}
variable "display_name_compute1" {
    description = "Display name of compute1"
    type = string
    default = "compute1"
}
variable "display_name_compute2" {
    description = "Display name of compute2"
    type = string
    default = "compute2"
}
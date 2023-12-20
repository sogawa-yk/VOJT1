variable "compartment_id" {}
variable "vcn_name" {}
variable "vcn_dns_label" {}

########
variable "shape" {
    description = "The shape of compute instance"
    type = string
    default = "VM.Standard2.1"
}
variable "source_id" {
    description = "Source id of OS image"
    type = string
    default = "ocid1.image.oc1.ap-seoul-1.aaaaaaaazaztuefbkyydoflkd2eqaxtqgmqfjcrkkjtecdkrkhscxqevykta"
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

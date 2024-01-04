variable "compartment_ocid" {}
variable "instance_configuration_display_name" {
  type    = string
  default = "test"
}
variable "metadata" {}
variable "shape" {
  type    = string
  default = "VM.Standard2.1"
}

variable "compartment_id" {}
variable "instance_configuration_display_name" {}
variable "availability_domain" {}
variable "fault_domain" {}
variable "metadata" {}
variable "shape" {
  type    = string
  default = "VM.Standard2.1"
}
variable "subnet_id" {}

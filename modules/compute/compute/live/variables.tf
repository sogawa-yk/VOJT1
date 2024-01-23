# ここに書かれているものがcomputeのモジュールの引数になる
variable "compartment_id" {}
variable "shape" {}
variable "source_id" {}
variable "source_type" {}
variable "display_name" {}
variable "subnet_id" {}
variable "oci_ad_name" {}
variable "ssh_authorized_keys" {}
variable "server_port" {}
variable "assign_public_ip" {}
variable "plugins_configs" {
  type = list(object({
    name          = string
    desired_state = string
  }))
  description = "name: plugin name, desired_state: ENABLED or DISABLED"
}

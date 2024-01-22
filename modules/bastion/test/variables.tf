### BASTION ######################################
variable "bastion_bastion_type" {}
variable "compartment_ocid" {}
variable "bastion_client_cidr_block_allow_list" {}
variable "bastion_dns_proxy_status" {}
variable "bastion_max_session_ttl_in_seconds" {}
variable "bastion_name" {}
variable "session_target_resource_details_session_type" {}
variable "session_target_resource_details_target_resource_fqdn" {}
variable "target_resource_operation_system_user_name" {}
variable "session_target_resource_details_target_resource_port" {}
variable "session_target_resource_details_target_resource_private_ip_address" {}
variable "session_display_name" {}
variable "session_key_type" {}
variable "session_session_ttl_in_seconds" {}
variable "session_key_details_public_key_content" {}

### COMPUTE #######################################
variable "shape" {}
variable "source_id" {}
variable "source_type" {}
variable "display_name" {}
variable "server_port" {}
variable "assign_public_ip" {}

### NETWORK #######################################
variable "vcn_cidr_block" {}
variable "vcn_dns_label" {}
variable "vcn_display_name" {}
variable "public_security_list_display_name" {}
variable "private_security_list_display_name" {}
variable "public_subnet_cidr_block" {}
variable "private_subnet_cidr_block" {}
variable "public_subnet_display_name" {}
variable "private_subnet_display_name" {}
variable "internet_gateway_display_name" {}
variable "route_table_display_name" {}
variable "service_gateway_display_name" {}
variable "nat_gateway_display_name" {}
variable "load_balancer_enabled" {}
variable "load_balancer_display_name" {}
variable "backend_set_name" {}
variable "listener_name" {}

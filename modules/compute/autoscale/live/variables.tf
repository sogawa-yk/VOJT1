### COMMON ##############################################
variable "compartment_id" {}
variable "availability_domain" {}
variable "subnet_id" {}

### INSTANCE_CONFIGURATION ##############################
variable "metadata" {}
variable "shape" {}
variable "instance_configuration_display_name" {}
variable "image_id" {}

### INSTANCE_POOL #######################################
variable "instance_pool_display_name" {}
variable "instance_pool_display_name_formatter" {}

### AUTOSCALING CONFIGURATION ###########################
variable "autoscaling_configuration_display_name" {}

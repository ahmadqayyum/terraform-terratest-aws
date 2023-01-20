variable "env_prefix_name"{
  type        =  string 
  description = "Environment prefix"
  default     = "existing"
}
variable "private_subnet_id" {}
variable "region"{}
variable "app_ami_id" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "app_instance_type" {}

variable "USER_DATA_DIR" {
  type        = string
  default     = "../../ssh_key"
  description = "local directory in which files will downloaded"
}
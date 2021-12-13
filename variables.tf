// Data resource variables
variable "vault_aws_backend" {
  type    = string
  default = "aws"
}

variable "vault_aws_role" {
  type = string
}

variable "aws_ami_owner" {
  type    = string
  default = "099720109477"
}

variable "aws_ami_filters" {
  type = list(any)
  default = [
    {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    },
    {
      name   = "virtualization-type"
      values = ["hvm"]
    }
  ]
}

// Vault Provider variables
variable "vault_addr" {
  type    = string
  default = "http://127.0.0.1:8200"
}

variable "vault_skip_tls_verify" {
  type    = bool
  default = false
}

variable "vault_max_lease_ttl_seconds" {
  type    = number
  default = 120
}

// AWS Security Group variables
variable "aws_sg_name" {
  type = string
}

variable "aws_sg_description" {
  type    = string
  default = ""
}

variable "aws_vpc_map" {
  type = map(any)
}

variable "aws_sg_ingress_rule" {
  type = list(any)
}

variable "aws_sg_egress_rule" {
  type = list(any)
}

variable "aws_sg_tags" {
  type    = map(any)
  default = {}
}

// AWS Spot Instance Request variables
variable "aws_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "aws_instance_ssh_key_name" {
  type    = string
  default = ""
}

variable "aws_ami_id" {
  type    = string
  default = ""
}

variable "aws_spot_price" {
  type    = string
  default = ""
}

variable "aws_spot_type" {
  type        = string
  description = "persistent or one-time"
  default     = "persistent"
}

variable "aws_spot_request_tags" {
  type    = map(any)
  default = {}
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_instance_user_data" {
  type    = string
  default = ""
}

variable "aws_instance_availability_zone" {
  type    = string
  default = ""
}

variable "aws_iam_instance_profile" {
  type    = string
  default = ""
}

variable "aws_instance_subnet_id" {
  type    = string
  default = ""
}

variable "aws_instance_vpc_security_group_ids" {
  type    = list(any)
  default = []
}
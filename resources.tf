data "vault_aws_access_credentials" "creds" {
  backend = var.vault_aws_backend
  role    = var.vault_aws_role
}

data "aws_ami" "cloud_instance" {
  owners      = [var.aws_ami_owner]
  most_recent = true

  dynamic "filter" {
    for_each = var.aws_ami_filters
    content {
      name   = filter.value["name"]
      values = filter.value["values"]
    }
  }
}

resource "aws_security_group" "cloud_instance" {
  name        = var.aws_sg_name
  description = var.aws_sg_description
  vpc_id      = lookup(var.aws_vpc_map, var.aws_region)
  ingress     = var.aws_sg_ingress_rule
  egress      = var.aws_sg_egress_rule
  tags        = var.aws_sg_tags
}

resource "aws_spot_instance_request" "cloud_instance" {
  spot_price           = var.aws_spot_price
  spot_type            = var.aws_spot_type
  wait_for_fulfillment = true
  tags                 = var.aws_spot_request_tags

  availability_zone      = var.aws_instance_availability_zone
  subnet_id              = var.aws_instance_subnet_id
  vpc_security_group_ids = var.aws_instance_vpc_security_group_ids
  iam_instance_profile   = var.aws_iam_instance_profile
  instance_type          = var.aws_instance_type
  ami                    = var.aws_ami_id != "" ? var.aws_ami_id : data.aws_ami.cloud_instance.id
  key_name               = var.aws_instance_ssh_key_name
  security_groups        = [aws_security_group.cloud_instance.name]
  user_data              = var.aws_instance_user_data
}

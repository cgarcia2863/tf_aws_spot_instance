terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

provider "vault" {
  address               = var.vault_addr
  skip_tls_verify       = var.vault_skip_tls_verify
  max_lease_ttl_seconds = var.vault_max_lease_ttl_seconds
}

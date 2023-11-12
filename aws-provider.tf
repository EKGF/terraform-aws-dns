# Configure the AWS Provider

provider "aws" {
  alias       = "dns"
  region      = var.aws_region
  access_key  = var.aws_access_key_id
  secret_key  = var.aws_secret_access_key

  # Assume the IAM Role "${local.stack}-ci-dns" which gives the current user permission to
  # build all the infrastructure defined in this directory.
  # This only works if the current user has the sts:AssumeRole permission.
  #
  # TODO: Make this a role that's more specific to all work related to "dns"
  #
  assume_role {
    role_arn = local.arn_ci_dns
  }
}

provider "aws" {
  alias       = "virginia"
  region      = "us-east-1" // has to be us-east-1 for SSL certificate to work
  access_key  = var.aws_access_key_id
  secret_key  = var.aws_secret_access_key

  # Assume the IAM Role "${local.stack}-ci-dns" which gives the current user permission to
  # build all the infrastructure defined in this directory.
  # This only works if the current user has the sts:AssumeRole permission.
  #
  # TODO: Make this a role that's more specific to all work related to "dns"
  #
  assume_role {
    role_arn = local.arn_ci_dns
  }
}

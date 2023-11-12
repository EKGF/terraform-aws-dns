locals {

  stack     = "${var.org_short}-${var.project_short}-${var.environment}"
  stack_ci  = "${var.org_short}-${var.project_short}-${var.environment}-ci"
  path      = "/${var.org_short}-${var.project_short}/${var.environment}/"
  path_ci   = "/${var.org_short}-${var.project_short}/${var.environment}/ci/"

  arn_ci      = "arn:aws:iam::${var.aws_account_id}:role${local.path_ci}${local.stack_ci}"
  arn_ci_dns  = "arn:aws:iam::${var.aws_account_id}:role${local.path_ci}${local.stack_ci}-dns"

  default_tags = {
    org_short     = var.org_short
    project       = var.project_short
    environment   = var.environment
  }

  fq_main_domain_name = "${var.main_domain_name}.${var.root_domain_name}"
}

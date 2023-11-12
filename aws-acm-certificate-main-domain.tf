

data "aws_acm_certificate" "issued_for_main_domain" {
  domain   = local.fq_main_domain_name
  statuses = ["ISSUED", "PENDING_VALIDATION"]
  provider = aws.virginia
}

output "certificate_arn_for_main_domain" {
  value = data.aws_acm_certificate.issued_for_main_domain.arn
}


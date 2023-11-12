
resource "aws_acm_certificate" "environment_domain" {
  domain_name       = aws_route53_zone.environment_domain.name
  validation_method = "DNS"
  provider          = aws.virginia
  tags              = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "environment_domain_certificate_validation_records" {
  for_each = {
    for dvo in aws_acm_certificate.environment_domain.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.environment_domain.zone_id
}

resource "aws_acm_certificate_validation" "environment_domain_certificate_validation" {
  count                   = var.skip_certificate_validation ? 0 : 1
  certificate_arn         = aws_acm_certificate.environment_domain.arn
  validation_record_fqdns = [for record in aws_route53_record.environment_domain_certificate_validation_records : record.fqdn]
  provider                = aws.virginia

  timeouts {
    create = "60m"
  }
}

output "certificate_arn_for_environment_domain" {
  value = aws_acm_certificate.environment_domain.arn
}

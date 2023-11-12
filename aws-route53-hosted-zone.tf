
data "aws_route53_zone" "main_domain" {
  provider      = aws.dns
  name          = local.fq_main_domain_name
}

output "main_domain_id" {
  value = data.aws_route53_zone.main_domain.id
}

output "main_domain_name" {
  value = data.aws_route53_zone.main_domain.name
}

resource "aws_route53_zone" "environment_domain" {
  provider      = aws.dns
  name          = "${var.environment}.${data.aws_route53_zone.main_domain.name}"
  force_destroy = true
}

output "environment_domain_id" {
  value = aws_route53_zone.environment_domain.id
}

output "environment_domain_name" {
  value = aws_route53_zone.environment_domain.name
}

resource "aws_route53_record" "environment_domain_ns" {
  provider  = aws.dns
  name      = aws_route53_zone.environment_domain.name
  records   = aws_route53_zone.environment_domain.name_servers
  ttl       = var.ttl
  type      = "NS"
  zone_id   = data.aws_route53_zone.main_domain.zone_id
}

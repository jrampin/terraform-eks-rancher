output "main_domain" {
  value = data.aws_route53_zone.main_domain
}

output "aws_route53_record_rancher_record" {
  value = aws_route53_record.rancher_record
}

output "aws_route53_record_wildcard_record" {
  value = aws_route53_record.wildcard_record
}
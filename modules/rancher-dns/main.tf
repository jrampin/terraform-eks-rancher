data "aws_route53_zone" "main_domain" {
  name = var.domain_name
}

resource "aws_route53_record" "rancher_record" {
  zone_id = data.aws_route53_zone.main_domain.zone_id
  name    = "${var.project_name}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [
    var.rancher_instance.public_ip
    ]
}

resource "aws_route53_record" "wildcard_record" {
  zone_id = data.aws_route53_zone.main_domain.zone_id
  name    = "*.${var.project_name}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [
    var.k8s-1_instance.public_ip,
    var.k8s-2_instance.public_ip,
    var.k8s-3_instance.public_ip
    ]
}
locals {
  enabled = module.this.enabled
}

data "aws_route53_zone" "default" {
  count = module.this.enabled ? 1 : 0

  name         = var.zone_name
  private_zone = var.private_zone
  zone_id      = var.zone_id
  vpc_id       = var.zone_vpc_id
  tags         = var.zone_tags
}

resource "aws_route53_record" "default" {
  count   = module.this.enabled ? 1 : 0
  name    = var.dns_name == "" ? module.this.id : var.dns_name
  zone_id = join("", data.aws_route53_zone.default[*].zone_id)
  type    = var.type
  ttl     = var.ttl
  records = var.records
}
resource "aws_route53_record" "default" {
  count   = module.this.enabled ? 1 : 0
  name    = module.this.name
  zone_id = var.zone_id
  type    = var.type
  ttl     = var.ttl
  records = var.records
}

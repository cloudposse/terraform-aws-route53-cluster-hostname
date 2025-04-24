locals {
  enabled = module.this.enabled
}

data "aws_route53_zone" "default" {
  count = local.enabled ? 1 : 0

  name         = var.zone_name
  private_zone = var.private_zone
  zone_id      = var.zone_id
  vpc_id       = var.zone_vpc_id
  tags         = var.zone_tags
}

resource "aws_route53_record" "default" {
  count   = local.enabled ? 1 : 0
  name    = var.dns_name == "" ? module.this.id : var.dns_name
  zone_id = join("", data.aws_route53_zone.default[*].zone_id)
  type    = var.type
  ttl     = var.ttl
  records = var.records
}

resource "aws_route53_health_check" "default" {
  count = local.enabled && var.healthcheck_enabled ? 1 : 0

  fqdn       = coalesce(var.healthcheck_settings.domain, aws_route53_record.default[0].fqdn)
  ip_address = var.healthcheck_settings.ip_address
  type       = var.healthcheck_settings.type
  port       = var.healthcheck_settings.port
  regions    = var.healthcheck_settings.regions

  reference_name  = var.healthcheck_settings.reference_name
  resource_path   = var.healthcheck_settings.resource_path
  search_string   = var.healthcheck_settings.search_string
  measure_latency = var.healthcheck_settings.measure_latency

  routing_control_arn = var.type == "RECOVERY_CONTROL" ? var.healthcheck_settings.routing_control_arn : null
  enable_sni          = var.type == "HTTPS" ? true : false

  # Must be either 10 or 30
  request_interval = var.healthcheck_settings.request_interval
  # Must be between 0 and 256
  child_health_threshold = var.healthcheck_settings.child_health_threshold
  child_healthchecks     = var.healthcheck_settings.child_healthchecks
  invert_healthcheck     = var.healthcheck_settings.invert_healthcheck
  failure_threshold      = var.healthcheck_settings.failure_threshold
  # Valid values are Healthy , Unhealthy and LastKnownStatus
  insufficient_data_health_status = var.healthcheck_settings.insufficient_data_health_status
}

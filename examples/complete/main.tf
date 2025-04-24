provider "aws" {
  region = var.region
}

module "hostname" {
  source = "../../"

  zone_id = var.zone_id
  type    = var.type
  records = var.records
  ttl     = var.ttl

  healthcheck_enabled = var.healthcheck_enabled

  context = module.this.context
}

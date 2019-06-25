provider "aws" {
  region = var.region
}

module "hostname" {
  source = "../../"

  namespace = var.namespace
  stage     = var.stage
  name      = var.name
  zone_id   = var.zone_id
  records   = var.records
}

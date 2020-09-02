provider "aws" {
  region = var.region
}

module "hostname" {
  source = "../../"

  zone_id = var.zone_id
  records = var.records

  context = module.this.context
}

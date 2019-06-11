variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}

variable "namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
  default     = "dns"
}

variable "zone_id" {
  default     = ""
  description = "Route53 DNS Zone id"
}

variable "records" {
  type        = list(string)
  description = "Records"
}

variable "type" {
  default     = "CNAME"
  description = "Type"
}

variable "ttl" {
  default     = "300"
  description = "The TTL of the record to add to the DNS zone to complete certificate validation"
}


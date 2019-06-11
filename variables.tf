variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = string
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
  default     = "dns"
}

variable "zone_id" {
  type        = string
  default     = ""
  description = "Route53 DNS Zone id"
}

variable "records" {
  type        = list(string)
  description = "Records"
}

variable "type" {
  type        = string
  default     = "CNAME"
  description = "Type"
}

variable "ttl" {
  type        = string
  default     = "300"
  description = "The TTL of the record to add to the DNS zone to complete certificate validation"
}


variable "region" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "records" {
  type = list(string)
}

variable "type" {
  type        = string
  default     = "CNAME"
  description = "Type of DNS records to create"
}

variable "ttl" {
  type        = number
  default     = 300
  description = "The TTL of the record to add to the DNS zone to complete certificate validation"
}

variable "healthcheck_enabled" {
  type        = bool
  description = "Whether to create a Route53 health check"
  default     = false
}


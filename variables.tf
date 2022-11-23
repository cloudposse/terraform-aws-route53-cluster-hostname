variable "zone_id" {
  type        = string
  description = "Route53 DNS Zone ID"
  default     = null
}

variable "zone_name" {
  type        = string
  description = "The Hosted Zone name of the desired Hosted Zone."
  default     = null
}

variable "private_zone" {
  type        = bool
  description = "Used with `zone_name` input to get a private Hosted Zone."
  default     = null
}

variable "zone_vpc_id" {
  type        = string
  description = "Used with `zone_name` input to get a private Hosted Zone associated with the `vpc_id` (in this case, private_zone is not mandatory)."
  default     = null
}

variable "zone_tags" {
  type        = map(string)
  description = "Used with `zone_name` input. A map of tags, each pair of which must exactly match a pair on the desired Hosted Zone."
  default     = null
}

variable "records" {
  type        = list(string)
  description = "DNS records to create"
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

variable "dns_name" {
  type        = string
  description = "The name of the DNS record"
  default     = ""
}
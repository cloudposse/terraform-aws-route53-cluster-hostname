variable "zone_id" {
  type        = string
  description = "Route53 DNS Zone ID"
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
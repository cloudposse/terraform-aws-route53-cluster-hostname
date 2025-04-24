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

variable "healthcheck_enabled" {
  type        = bool
  description = "Whether to create a Route53 health check"
  default     = false
}

variable "healthcheck_settings" {
  type = object({
    domain                          = optional(string)
    ip_address                      = optional(string)
    regions                         = optional(list(string))
    type                            = optional(string, "HTTPS")
    request_interval                = optional(string, "30")
    port                            = optional(number, 443)
    reference_name                  = optional(string)
    resource_path                   = optional(string)
    failure_threshold               = optional(number)
    search_string                   = optional(string)
    measure_latency                 = optional(bool)
    invert_healthcheck              = optional(bool)
    child_healthchecks              = optional(list(string))
    routing_control_arn             = optional(string)
    child_health_threshold          = optional(number)
    cloudwatch_alarm_name           = optional(string)
    cloudwatch_alarm_region         = optional(string)
    insufficient_data_health_status = optional(string)
  })
  description = <<EOT
  Route 53 health check configuration settings

  domain: The fully qualified domain name of the endpoint to be checked
  ip_address: The IP address of the endpoint to be checked
  regions: AWS regions to run the health checks from
  type: The protocol to use for the health check such as HTTP HTTPS TCP etc
  port: Port on the endpoint to be checked
  reference_name: Used in caller reference and helpful for identifying individual health check sets
  resource_path: The URL path Route 53 requests during the health check
  failure_threshold: Number of consecutive health checks that an endpoint must pass or fail
  search_string: String searched in response body for match checks
  measure_latency: Whether to measure and report latency from multiple regions
  invert_healthcheck: If true a healthy check is considered unhealthy and vice versa
  child_healthchecks: List of health check IDs for associated child checks
  routing_control_arn: ARN of the Application Recovery Controller routing control
  request_interval: Interval between health check requests in seconds
  child_health_threshold: Minimum number of child checks that must be healthy
  cloudwatch_alarm_name: Name of the CloudWatch alarm to evaluate
  cloudwatch_alarm_region: Region where the CloudWatch alarm is configured
  insufficient_data_health_status: Status to assign when CloudWatch has insufficient data
  EOT
  default     = {}
  nullable    = false
}

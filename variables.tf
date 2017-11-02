variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}

variable "namespace" {
  default = "global"
}

variable "stage" {
  default = "default"
}

variable "name" {
  default = "dns"
}

variable "zone_id" {}

variable "records" {
  type = "list"
}

variable "type" {
  default = "CNAME"
}

variable "ttl" {
  default = "300"
}

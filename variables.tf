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

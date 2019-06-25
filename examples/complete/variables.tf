variable "region" {
  type = string
}

variable "namespace" {
  type = string
}

variable "name" {
  type = string
}

variable "stage" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "records" {
  type = list(string)
}

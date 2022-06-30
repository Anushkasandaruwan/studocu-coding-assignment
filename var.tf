

variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "environment" {
  type    = string
  default = "adm-practical-interview"
}

variable "domain_name" {
  type    = string
}


variable "hosted_zone_name" {
  type    = string
}
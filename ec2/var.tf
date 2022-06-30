variable "vpc_name" {
  type    = string
  default = "studoc-practical-interview-vpc"
}

variable "environment_name" {
  type    = string
  default = "studoc-practical-interview"
}

variable "vpc" {
  type    = any
}

variable "bastion_sg_id" {
  type    = string

}

variable "key_name" {
  type    = string
  default = "bastion"
}
variable "asg_name" {
  type    = string
  default = "studoc-practical-interview-asg"
}

variable "vpc" {
  type    = any
}

variable "alb_sg" {
    type = any
}

variable "alb_tg_arn" {
    type = any
}


variable "key_name" {
  type    = string
  default = "ssh-key"
}
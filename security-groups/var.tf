variable "alb_sg_name" {
  type    = string
  default = "studoc-alb-sg"
}

variable "asg_sg_name" {
  type    = string
  default = "studoc-asg-sg"
}

variable "bastion_sg_name" {
  type    = string
  default = "studoc-bastion-sg"
}
variable "vpc_id" {
  type    = string
}
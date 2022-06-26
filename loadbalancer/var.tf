variable "lb_name" {
  type    = string
  default = "studoc-practical-interview-lb"
}

# variable "vpc_private_subnets" {
#   description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
#   type        = list(string)
#   default     = null
# }

# variable "vpc_public_subnets" {
#     type = list(string)
# }

variable "vpc" {
  type    = any
}

variable "alb_sg" {
    type = any
}
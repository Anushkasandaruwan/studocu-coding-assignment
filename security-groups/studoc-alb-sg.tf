resource "aws_security_group" "alb_sg" {
  name_prefix = var.alb_sg_name
  vpc_id      = var.vpc_id
  description = "Manage Access to ALB"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    description = "Manage Access to ALB"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  lifecycle {
    create_before_destroy = true
  }
}
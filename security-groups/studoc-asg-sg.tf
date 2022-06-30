##############################################################################
#######################      ALB asg        ##############################
##############################################################################

resource "aws_security_group" "asg_sg" {
  name_prefix = var.asg_sg_name
  vpc_id      = var.vpc_id
  description = "Manage Access to ASG"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    description = "Manage Access to ASG"
    security_groups = [aws_security_group.alb_sg.id]
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

    tags = {
    Name = "studocu"
  }
}
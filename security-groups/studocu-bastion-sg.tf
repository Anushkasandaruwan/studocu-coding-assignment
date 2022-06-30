##############################################################################
#######################      ALB asg        ##############################
##############################################################################

resource "aws_security_group" "bastion_sg" {
  name_prefix = var.bastion_sg_name
  vpc_id      = var.vpc_id
  description = "Manage Access to ALB"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    description = "Manage SSH access to bastion"
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

    tags = {
    Name = "studocu"
  }
}
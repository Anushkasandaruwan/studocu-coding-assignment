##############################################################################
#######################      Bastion Ec2        ##############################
##############################################################################


module "linux-bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "${var.environment_name}-bastion"

  instance_count = 1

  ami                    = data.aws_ami.bastion_ami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.bastion_key.key_name
  monitoring             = true
  vpc_security_group_ids = [var.bastion_sg_id]
  subnet_id              = var.vpc.public_subnets[0]
  tags = {
    Name = "studocu"
  }
}
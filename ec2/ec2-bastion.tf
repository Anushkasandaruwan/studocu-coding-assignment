##############################################################################
#######################      Bastion Ec2        ##############################
##############################################################################


module "linux-bastion" {
  depends_on      = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "${var.environment_name}-bastion"

  instance_count = 1

  ami                    = data.aws_ami.bastion_ami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.bastion.id]
  subnet_id              = module.vpc.studoc.public_subnets[0]
  user_data              = file("install_kubectl.sh")
  tags = {
  //  Environment = var.environment
  }
}
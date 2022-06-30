data "aws_ami" "bastion_ami" {
  most_recent = true

  #search ami using owner
  owners = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  #filter to isolate ami
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
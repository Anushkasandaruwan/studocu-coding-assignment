##############################################################################
#######################      Auto Scalling Group         ##############################
##############################################################################


module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = var.asg_name

  min_size                  = 3
  max_size                  = 3
  desired_capacity          = 3
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = var.vpc.private_subnets
  target_group_arns         = var.alb_tg_arn
  initial_lifecycle_hooks = [
    {
      name                  = "StartupLifeCycleHook"
      default_result        = "CONTINUE"
      heartbeat_timeout     = 60
      lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    },
    {
      name                  = "TerminationLifeCycleHook"
      default_result        = "CONTINUE"
      heartbeat_timeout     = 180
      lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    }
  ]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      checkpoint_delay       = 600
      checkpoint_percentages = [35, 70, 100]
      instance_warmup        = 300
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }

  # Launch template
  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = data.aws_ami.application_ami.id
  instance_type     = "t3.micro"
  ebs_optimized     = true
  enable_monitoring = true
  user_data = filebase64("${path.module}/user-data.sh")
  key_name = aws_key_pair.generated_key.key_name

  # IAM role & instand profile
  create_iam_instance_profile = true
  iam_role_name               = "example-asg"
  iam_role_path               = "/ec2/"
  iam_role_description        = "IAM role example"
  iam_role_tags = {
    CustomIamRole = "Yes"
  }
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
      }, {
      device_name = "/dev/sda1"
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 30
        volume_type           = "gp2"
      }
    }
  ]


  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = [var.alb_sg.id]
    }
  ]

  tags = {
    Name = "studocu"
  }
}
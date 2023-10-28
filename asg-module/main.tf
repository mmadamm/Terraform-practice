
#security group to be used by the luanch template 

resource "aws_security_group" "launch-security_group" {
  name          = "ec2-ssh-security-group"
  description   = "Allow SSH access to EC2 instance"
  vpc_id        = var.vpc-id

   dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "template_file" "user_data_template" {
  template = file("${path.module}/user-data.tpl")

  vars = {
    efs_dns_name = var.efs_dns_name
  }
}


#luanch template 
resource "aws_launch_template" "ec2-launch-temp" {
    instance_type           = var.instance_type
    image_id                = var.image_id
    instance_initiated_shutdown_behavior = "terminate"
    vpc_security_group_ids  = [aws_security_group.launch-security_group.id]

    user_data = base64encode(data.template_file.user_data_template.rendered) 
  
}

# Auta scaling group 

resource "aws_autoscaling_group" "asg" {
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  vpc_zone_identifier       = var.subnets    

  launch_template {
     id = aws_launch_template.ec2-launch-temp.id
  }
}
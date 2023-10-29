
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
 tags = var.tags
}

#=============================================================#


#luanch template 
resource "aws_launch_template" "ec2-launch-temp" {
    instance_type           = var.instance_type
    image_id                = var.image_id
    instance_initiated_shutdown_behavior = "terminate"
    vpc_security_group_ids  = [aws_security_group.launch-security_group.id]
  
    
    user_data = base64encode(<<-EOF
        #!/bin/bash
        EFS_FILE_SYSTEM_ID="${var.efs_dns_name}"
        MOUNT_DIR="/mnt/efs"
        sudo yum -y install nfs-utils
        sudo service nfs-server start
        sudo mkdir -p $MOUNT_DIR
        sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $EFS_FILE_SYSTEM_ID:/ $MOUNT_DIR
        sudo chmod go+rw $MOUNT_DIR
        sudo touch adam.txt
EOF
)


   tags = var.tags

}
#=============================================================#

# Auto scaling group 

resource "aws_autoscaling_group" "asg" {

  name                      = var.tags.company
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  vpc_zone_identifier       = var.subnets

  launch_template {
     id = aws_launch_template.ec2-launch-temp.id
  }

}
#==============================================================#

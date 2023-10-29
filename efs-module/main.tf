#efs security group 

resource "aws_security_group" "efs_security_group" {
  name        = "efs-security-group"
  description = "Security group for EFS"
  vpc_id      = var.vpc-id

 ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = var.tags

}
#===========================================================#


resource "aws_efs_file_system" "efs" {
  creation_token         = "my-efs"
  performance_mode       = var.performance_mode
  throughput_mode        = var.throughput_mode
  encrypted              = var.encryption

    tags = var.tags

 
}
#===========================================================#

# EFS Mount Targets (Create one for each subnet)
resource "aws_efs_mount_target" "efs_mount_target" {
  count           = length(var.subnets)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.subnets[count.index]
  security_groups = [aws_security_group.efs_security_group.id]
  
}

#===========================================================#
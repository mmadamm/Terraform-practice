variable "vpc-id" {
  description = "static value for this project but you can ovverrid it "
  type = string
}

variable "subnets" {
  description = "static value for this project but you can ovverrid it "
  type = list(string)
    
}



#dynamic variables 

variable "performance_mode" {
  description = "the performance mode of the efs"
  type = string
  default = "generalPurpose"
}

variable "throughput_mode" {
  description = "the thouput mode"
  type = string
  default = "bursting"
}

variable "encryption" {
  description = "define if the efs is encrypted or not "
  type = bool
  default = true
  
}


#tags

variable "tags" {
  description = "Tags to apply to EFS resources"
  type        = map(string)
  default     = {
        company="fawry"
        team   ="devops"
  }
}


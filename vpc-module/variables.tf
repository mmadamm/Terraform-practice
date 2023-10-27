variable "vpc-cider" {
    description = "CIDR block for the VPC"
    type = string

}
variable "subnets_cidr_blocks" {
    description = "CIDR blocks for public subnets"
    type        = string
}

variable "azs" {
    description = "Availability zone for the subnet"
    type = string
  
}
variable "map_public_ip_on_launch" {
    description = "define if a public IP is assigned to instances launched in the subnet"
    type        = bool
    default     = true
}

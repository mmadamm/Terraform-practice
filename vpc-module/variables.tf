variable "vpc-cider" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.16.0.0/16"
}

variable "public_subnets_cidr_blocks" {
    description = "CIDR blocks for public subnets"
    type        = list(string)
    default     = [ "10.16.0.0/19","10.16.32.0/19","10.16.64.0/19",
                    "10.16.96.0/19","10.16.128.0/19","10.16.160.0/19"]
}

variable "map_public_ip_on_launch" {
    description = "define if a public IP is assigned to instances launched in the subnet"
    type        = bool
    default     = true
}

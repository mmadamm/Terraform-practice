data "aws_availability_zones" "azs" {
  state = "available"
}
#=========================================================#


resource "aws_vpc" "my-app" {
    cidr_block              = var.vpc-cider
    enable_dns_support      = true
    enable_dns_hostnames    = true
  
}
#=========================================================#

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my-app.id

   
}
#==========================================================#

resource "aws_subnet" "subnets" {
    count                   = length(var.public_subnets_cidr_blocks)
    vpc_id                  = aws_vpc.my-app.id
    cidr_block              = element(var.public_subnets_cidr_blocks, count.index)
    availability_zone       = element(data.aws_availability_zones.azs.names, count.index)
    map_public_ip_on_launch = var.map_public_ip_on_launch
     

}
#===========================================================#

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.my-app.id


}
#============================================================#
resource "aws_route" "router" {
  route_table_id            = aws_route_table.route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id

}
#============================================================#

resource "aws_route_table_association" "route_table_association" {
  count                     = length(var.public_subnets_cidr_blocks)
  subnet_id                 = aws_subnet.subnets[count.index].id
  route_table_id            = aws_route_table.route_table.id
}
#==============================================================#

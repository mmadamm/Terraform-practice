data "aws_availability_zones" "azs" {
  
}


resource "aws_vpc" "my-app" {
    cidr_block = var.vpc-cider
    enable_dns_support = true
    enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my-app.id
}

resource "aws_subnet" "subnets" {
    vpc_id =     aws_vpc.my-app.id
    cidr_block = var.subnets_cidr_blocks
    availability_zone = var.azs
    map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.my-app.id

}

resource "aws_route" "router" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnets.id
  route_table_id = aws_route_table.route_table.id
}

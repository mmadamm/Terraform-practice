output "vpc_id" {
  value = aws_vpc.my-app.id
  description = "output the vpc id "
}


output "subnet_id" {
  value = [for subnet in aws_subnet.subnets : subnet.id]
  description = "output each subnet in the vpc "
}


output "route_table_id" {
  value = aws_route_table.route_table.id
  description = "the rout table id "
}
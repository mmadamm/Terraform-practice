output "vpc_id" {
  value = aws_vpc.my-app.id
}

output "subnet_id" {
  value = aws_subnet.subnets.id
}

output "route_table_id" {
  value = aws_route_table.route_table.id
}
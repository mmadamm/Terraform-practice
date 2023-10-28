output "vpc_id" {
  value = aws_vpc.my-app.id
}

output "subnet_id" {
  value = [for subnet in aws_subnet.subnets : subnet.id]
}

output "route_table_id" {
  value = aws_route_table.route_table.id
}
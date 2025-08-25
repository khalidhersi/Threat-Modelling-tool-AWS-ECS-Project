output "ecr_repository_url" {
  value = aws_ecr_repository.web.repository_url
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
}

output "private_subnets" {
  value = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
}

output "nat_gateway_ids" {
  value = [aws_nat_gateway.natgw1.id, aws_nat_gateway.natgw2.id]
}

output "web_sg_id" {
  value = aws_security_group.webSg.id
}

output "alb_sg_id" {
  value = aws_security_group.albSg.id
}

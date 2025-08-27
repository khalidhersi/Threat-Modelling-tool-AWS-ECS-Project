output "web_sg_id" {
  value = aws_security_group.webSg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

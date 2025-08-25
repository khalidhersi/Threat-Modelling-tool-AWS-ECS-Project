output "alb_dns" {
  value = module.alb.alb_dns_name
}

output "ecr_url" {
  value = aws_ecr_repository.web.repository_url
}

output "ecs_service_name" {
  value = module.ecs.service_name
}
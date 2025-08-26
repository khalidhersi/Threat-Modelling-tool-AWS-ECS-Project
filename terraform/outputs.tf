output "alb_dns" {
  value = module.alb.alb_dns_name
}

output "ecr_url" {
  value = aws_ecr_repository.web.repository_url
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "ecs_execution_role_arn" {
  value = module.ecs.execution_role_arn
}
output "ecr_repository_url" {
  value = aws_ecr_repository.web.repository_url
}

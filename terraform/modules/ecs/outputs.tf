output "service_name" {
  value = aws_ecs_service.this.name
}

output "execution_role_arn" {
  description = "The ARN of the ECS task execution IAM role"
  value       = aws_iam_role.ecs_task_execution.arn
}

output "task_definition_family" {
  value = aws_ecs_task_definition.this.family
}


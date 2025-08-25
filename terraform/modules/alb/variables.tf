variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the ALB will be deployed"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet IDs where ALB will be deployed"
}

variable "alb_sg" {
  type        = string
  description = "Security group ID for the ALB"
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group to link with the ECS service"
}

variable "target_group_port" {
  type        = number
  description = "Port the target group forwards traffic to (should match container_port)"
  default     = 3000
}
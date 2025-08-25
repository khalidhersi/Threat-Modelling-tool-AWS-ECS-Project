variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "family" {
  type        = string
  description = "Family name for the ECS task definition"
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
}

variable "container_name" {
  type        = string
  description = "Name of the container in the task definition"
}

variable "container_image" {
  type        = string
  description = "mage URL for the container"
}

variable "container_port" {
  type        = number
  description = "Port the container listens on (for port mapping)"
  default     = 3000
}

variable "cpu" {
  type        = string
  description = "Amount of CPU to allocate to the task"
  default     = "256"
}

variable "memory" {
  type        = string
  description = "Amount of memory to allocate to the task"
  default     = "512"
}

variable "desired_count" {
  type        = number
  description = "Number of ECS task instances to run"
  default     = 2
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where ECS service will be deployed"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs for ECS task placement"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID for ECS tasks"
}

variable "initial_container_image" {
  type        = string
  description = "Initial image to deploy; updated later via GitHub Actions"
  default     = "226754875437.dkr.ecr.eu-west-2.amazonaws.com/ecs-threat-composer-tool:latest"
}

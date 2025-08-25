variable "aws_region" {
  type        = string
  description = "region chosen"
  default     = "eu-west-2"
}

variable "availability_zone1" {
  type        = string
  description = "First availability zone"
}

variable "availability_zone2" {
  type        = string
  description = "Second availability zone"
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket for logs or shared storage"
}


variable "cluster_name" {
  type        = string
  description = "ECS cluster name"
}

variable "family" {
  type        = string
  description = "ECS task definition family"
}

variable "service_name" {
  type        = string
  description = "ECS service name"
}

variable "container_name" {
  type        = string
  description = "Container name"
}

variable "container_image" {
  type        = string
  description = "ECR image to deploy"
}

variable "container_port" {
  type        = number
  description = "Port your app listens on"
  default     = 3000
}

variable "cpu" {
  type        = string
  description = "CPU units for the ECS task"
  default     = "256"
}

variable "memory" {
  type        = string
  description = "Memory in MiB for the ECS task"
  default     = "512"
}

variable "desired_count" {
  type        = number
  description = "Number of running ECS tasks"
  default     = 1
}
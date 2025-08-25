variable "cluster_name" {
  type = string
}

variable "family" {
  type = string
}

variable "service_name" {
type = string
}

variable "container_name" {
 type = string
}

variable "container_image" {
  type = string
}

variable "container_port" {
  type = number
  default = 3000
}

variable "cpu" {
  type = string
  default = "256"
}

variable "memory" {
  type = string
  default = "512"
}

variable "desired_count" {
  type = number
  default = 2
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

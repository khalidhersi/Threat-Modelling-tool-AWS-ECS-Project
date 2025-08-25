variable "cluster_name" {
  default = ""
}

variable "family" {
  default = ""
}

variable "service_name" {
  default = ""
}

variable "container_name" {
  default = ""
}

variable "container_image" {
  default = ""
}

variable "container_port" {
  default = 3000
}

variable "cpu" {
  default = "256"
}

variable "memory" {
  default = "512"
}

variable "desired_count" {
  default = 2
}

variable "vpc_id" {
  default = ""
}

variable "private_subnets" {
  type = list(string)
}

variable "security_group_id" {
    default = ""
}

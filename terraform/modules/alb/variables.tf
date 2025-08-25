variable "alb_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "alb_sg" {
  type = string
}

variable "target_group_name" {
  type = string
}

variable "target_group_port" {
  type = number
  default = 3000
}

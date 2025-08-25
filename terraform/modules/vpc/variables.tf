variable name {
  type = string
  description = "project name "
  default = "ecs-threat-composer-tool"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  type        = string
  description = "CIDR block for the 1st public subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet2_cidr" {
  type        = string
  description = "CIDR block for the 2nsd public subnet"
  default     = "10.0.2.0/24"
}

variable "private_subnet1_cidr" {
  type        = string
  description = "CIDR block for the 1st private subnet"
  default     = "10.0.11.0/24"
}

variable "private_subnet2_cidr" {
  type        = string
  description = "CIDR block for the 2nd private subnet"
  default     = "10.0.12.0/24"
}

variable availability_zone1 {
  type = string
  description = "1st availability zone"
  default = "eu-west-2a"
}

variable availability_zone2 {
  type = string
  description = "2nd availability zone"
  default = "eu-west-2b"
}

variable "bucket_name" {
  type = string
  description = "Unique S3 bucket name"
  default = "klds-ecs-threat-composer-tool-s3-bucket"
}

variable "all_ports_cidr" {
  type        = string
  description = "All ports CIDR block for sg & rt"
  default = "0.0.0.0/0"
}
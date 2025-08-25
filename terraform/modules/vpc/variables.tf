variable name {
  type = string
  default = "ecs-threat-composer-tool"
}

variable availability_zone1 {
  type = string
  default = "eu-west-2a"
}

variable availability_zone2 {
  type = string
  default = "eu-west-2b"
}

variable "bucket_name" {
  type = string
  default = "klds-ecs-threat-composer-tool-s3-bucket"
}
variable name {
  default = "ecs-threat-composer-tool"
}

variable availability_zone1 {
  default = "eu-west-2a"
}

variable availability_zone2 {
  default = "eu-west-2b"
}

variable "bucket_name" {
  type = string
  default = "klds-ecs-threat-composer-tool-s3-bucket"
}
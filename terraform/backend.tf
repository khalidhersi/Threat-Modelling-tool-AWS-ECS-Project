terraform {
  backend "s3" {
    bucket         = "khalids-ecs-threat-composer-tool-s3-bucket"
    key            = "terraform/ecs-threat-composer-tool.tfstate"
    region         = "eu-west-2"
    encrypt        = true
  }
}

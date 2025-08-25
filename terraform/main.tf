provider "aws" {
  region = var.aws_region
}

# VPC module
module "vpc" {
  source             = "./modules/vpc"
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
  bucket_name        = var.bucket_name
}

# Aplication Load Balancer module
module "alb" {
  source = "./modules/alb"

  alb_name          = "app-alb"
  vpc_id            = module.vpc.vpc_id
  public_subnets    = module.vpc.public_subnets
  alb_sg            = module.vpc.alb_sg_ids
  target_group_name = "app-tg"
  target_group_port = 3000
}


# ECS module
module "ecs" {
  source = "./modules/ecs"

  cluster_name    = var.cluster_name
  family          = var.family
  service_name    = var.service_name
  container_name  = var.container_name
  container_image = var.container_image
  container_port  = var.container_port
  cpu             = var.cpu
  memory          = var.memory
  desired_count   = var.desired_count

  vpc_id            = module.vpc.vpc_id
  private_subnets   = module.vpc.private_subnets
  security_group_id = module.vpc.web_sg_id
}

# ECR repository
resource "aws_ecr_repository" "web" {
  name                 = "ecs-threat-composer-tool"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
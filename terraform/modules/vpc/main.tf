resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
 tags = {
    Name = "Vpc"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name = "public-subnet-1"
  }

}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name = "public-subnet-2"
  }

}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name = "private-subnet-1"
  }

}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name = "private-subnet-2"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
    tags = {
    Name = "internet gateway"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route table"
  }
}

resource "aws_route_table_association" "rta1" {
  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.public_subnet1.id
}

resource "aws_route_table_association" "rta2" {
  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.public_subnet2.id
}

resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = aws_vpc.this.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web secuirty group"
  }
}

resource "aws_s3_bucket" "s3Bucket" {
  bucket = var.bucket_name
  tags = {
    Name = var.bucket_name
  }
}

resource "aws_eip" "nat1" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name ="elastic ip 1"
  }
}

resource "aws_eip" "nat2" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name ="elastic ip 2"
  }
}

resource "aws_nat_gateway" "natgw1" {
  subnet_id     = aws_subnet.public_subnet1.id
  allocation_id = aws_eip.nat1.id

  tags = {
    Name ="nat gateway 1"
  }
}

resource "aws_nat_gateway" "natgw2" {
  subnet_id     = aws_subnet.public_subnet2.id
  allocation_id = aws_eip.nat2.id

  tags = {
    Name ="nat gateway 2"
  }
}

resource "aws_route_table" "private_rt1" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw1.id
  }

  tags = {
    Name ="private route table 1"
  }
}

resource "aws_route_table" "private_rt2" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw2.id
  }

  tags = {
    Name ="private route table 2"
  }
}

resource "aws_route_table_association" "private_rta1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt1.id
}

resource "aws_route_table_association" "private_rta2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt2.id
}

resource "aws_security_group" "alb_sg" {
  name   = "alb"
  vpc_id = aws_vpc.this.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "load balancer-sg"
  }
}

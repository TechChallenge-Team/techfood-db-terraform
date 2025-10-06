data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.projectName}-vpc"]
  }
}

data "aws_security_group" "eks_sg" {
  filter {
    name   = "tag:Name"
    values = ["${var.projectName}-eks-sg"]
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = ["${var.projectName}-public-subnet-*"]
  }
}
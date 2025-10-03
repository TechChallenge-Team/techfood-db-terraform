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
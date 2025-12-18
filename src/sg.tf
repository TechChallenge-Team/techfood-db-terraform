resource "aws_security_group" "rds_sg" {
  name        = "${var.projectName}-rds-sg"
  description = "Security group for RDS SQL Server"
  vpc_id      = data.aws_vpc.vpc.id

  # Acesso interno do EKS
  ingress {
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    security_groups = [data.aws_security_group.eks_sg.id]
    description     = "SQL Server access from EKS nodes"
  }

  # Acesso externo (da internet)
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SQL Server access from internet"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.projectName}-rds-sg"
  })
}

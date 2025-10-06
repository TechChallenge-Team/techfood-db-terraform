resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.projectName}-db-subnet-group"
  subnet_ids = data.aws_subnets.public_subnets.ids

  tags = merge(var.tags, {
    Name = "${var.projectName}-db-subnet-group"
  })
}
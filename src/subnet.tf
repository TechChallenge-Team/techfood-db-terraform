resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.projectName}-db-subnet-group"
  subnet_ids = [for subnet in aws_subnet.subnet_public : subnet.id]

  tags = merge(var.tags, {
    Name = "${var.projectName}-db-subnet-group"
  })
}
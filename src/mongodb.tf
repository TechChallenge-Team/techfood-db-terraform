# ================================================================================
# DOCUMENTDB (MongoDB-compatible) CLUSTER
# ================================================================================

# DocumentDB Cluster Parameter Group
resource "aws_docdb_cluster_parameter_group" "mongodb_params" {
  family      = "docdb5.0"
  name        = "${var.projectName}-docdb-params"
  description = "DocumentDB cluster parameter group for ${var.projectName}"

  parameter {
    name  = "tls"
    value = "disabled" # Desabilitado para facilitar conexão em ambiente de desenvolvimento
  }

  tags = merge(var.tags, {
    Name = "${var.projectName}-docdb-params"
  })
}

# DocumentDB Subnet Group
resource "aws_docdb_subnet_group" "mongodb_subnet_group" {
  name       = "${var.projectName}-docdb-subnet-group"
  subnet_ids = data.aws_subnets.public_subnets.ids

  tags = merge(var.tags, {
    Name = "${var.projectName}-docdb-subnet-group"
  })
}

# DocumentDB Cluster
resource "aws_docdb_cluster" "mongodb" {
  cluster_identifier              = "${var.projectName}-mongodb"
  engine                          = "docdb"
  engine_version                  = "5.0.0"
  master_username                 = var.docdb_master_username
  master_password                 = var.docdb_master_password
  backup_retention_period         = var.docdb_backup_retention_period
  preferred_backup_window         = var.docdb_preferred_backup_window
  preferred_maintenance_window    = "sun:05:00-sun:06:00"
  skip_final_snapshot             = var.docdb_skip_final_snapshot
  final_snapshot_identifier       = "${var.projectName}-mongodb-final-snapshot"
  db_subnet_group_name            = aws_docdb_subnet_group.mongodb_subnet_group.name
  vpc_security_group_ids          = [aws_security_group.docdb_sg.id]
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.mongodb_params.name
  enabled_cloudwatch_logs_exports = ["audit", "profiler"]
  storage_encrypted               = false # Desabilitado para compatibilidade com AWS Academy

  tags = merge(var.tags, {
    Name   = "${var.projectName}-mongodb"
    Type   = "DocumentDB"
    Engine = "MongoDB-compatible"
  })

  depends_on = [
    aws_docdb_subnet_group.mongodb_subnet_group,
    aws_security_group.docdb_sg,
    aws_docdb_cluster_parameter_group.mongodb_params
  ]
}

# DocumentDB Cluster Instances
resource "aws_docdb_cluster_instance" "mongodb_instances" {
  count              = var.docdb_cluster_size
  identifier         = "${var.projectName}-mongodb-instance-${count.index + 1}"
  cluster_identifier = aws_docdb_cluster.mongodb.id
  instance_class     = var.docdb_instance_class

  tags = merge(var.tags, {
    Name     = "${var.projectName}-mongodb-instance-${count.index + 1}"
    Type     = "DocumentDB Instance"
    Instance = count.index + 1
  })
}

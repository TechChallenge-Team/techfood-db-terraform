# ================================================================================
# OUTPUTS DO RDS SQL SERVER
# ================================================================================

output "rds_endpoint" {
  description = "RDS SQL Server endpoint"
  value       = aws_db_instance.sqlserver.endpoint
}

output "rds_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.sqlserver.identifier
}

output "rds_port" {
  description = "RDS SQL Server port"
  value       = aws_db_instance.sqlserver.port
}

output "rds_username" {
  description = "RDS master username"
  value       = aws_db_instance.sqlserver.username
  sensitive   = true
}

# ================================================================================
# OUTPUTS DOS SECURITY GROUPS
# ================================================================================

output "rds_security_group_id" {
  description = "ID do Security Group do RDS"
  value       = aws_security_group.rds_sg.id
}

output "docdb_security_group_id" {
  description = "ID do Security Group do DocumentDB"
  value       = aws_security_group.docdb_sg.id
}

# ================================================================================
# OUTPUTS DO DOCUMENTDB (MongoDB)
# ================================================================================

output "docdb_cluster_endpoint" {
  description = "DocumentDB cluster endpoint"
  value       = aws_docdb_cluster.mongodb.endpoint
}

output "docdb_cluster_reader_endpoint" {
  description = "DocumentDB cluster reader endpoint"
  value       = aws_docdb_cluster.mongodb.reader_endpoint
}

output "docdb_cluster_identifier" {
  description = "DocumentDB cluster identifier"
  value       = aws_docdb_cluster.mongodb.cluster_identifier
}

output "docdb_port" {
  description = "DocumentDB port"
  value       = aws_docdb_cluster.mongodb.port
}

output "docdb_master_username" {
  description = "DocumentDB master username"
  value       = aws_docdb_cluster.mongodb.master_username
  sensitive   = true
}

output "docdb_connection_string" {
  description = "DocumentDB connection string (sem senha)"
  value       = "mongodb://${aws_docdb_cluster.mongodb.master_username}:<password>@${aws_docdb_cluster.mongodb.endpoint}:${aws_docdb_cluster.mongodb.port}/?retryWrites=false"
  sensitive   = true
}

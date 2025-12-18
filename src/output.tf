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

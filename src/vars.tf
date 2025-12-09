variable "projectName" {
  default = "techfood"
}

variable "region_default" {
  default = "us-east-1"
}

variable "tags" {
  default = {
    Name        = "techfood",
    School      = "FIAP",
    Environment = "Production",
    Year        = "2025"
  }
}

# RDS SQL Server variables
variable "rds_instance_class" {
  description = "The instance type of the RDS instance"
  default     = "db.t3.micro" # Free tier eligible for AWS Academy
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gibibytes"
  default     = 20
}

variable "rds_max_allocated_storage" {
  description = "The upper limit for automatic storage scaling"
  default     = 50
}

variable "rds_username" {
  description = "Username for the master DB user"
  sensitive   = true
}

variable "rds_password" {
  description = "Password for the master DB user"
  sensitive   = true
}

variable "rds_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  default     = true
}

variable "rds_backup_retention_period" {
  description = "The days to retain backups for"
  default     = 7
}

# DocumentDB (MongoDB) variables
variable "docdb_instance_class" {
  description = "The instance type of the DocumentDB cluster instances"
  default     = "db.t3.medium"
}

variable "docdb_cluster_size" {
  description = "Number of instances in the DocumentDB cluster"
  default     = 1
}

variable "docdb_master_username" {
  description = "Username for the master DB user in DocumentDB"
  sensitive   = true
}

variable "docdb_master_password" {
  description = "Password for the master DB user in DocumentDB"
  sensitive   = true
}

variable "docdb_backup_retention_period" {
  description = "The days to retain backups for DocumentDB"
  default     = 7
}

variable "docdb_preferred_backup_window" {
  description = "The daily time range during which automated backups are created"
  default     = "07:00-09:00"
}

variable "docdb_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before deletion"
  default     = true
}

output "rds_endpoint" {
  description = "The endpoint of the RDS MySQL instance"
  value       = aws_db_instance.rds.endpoint
}
output "frontend_url" {
  value = aws_lb.main.dns_name
}

output "database_endpoint" {
  value = aws_db_instance.database.endpoint
}

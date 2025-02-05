data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "my-db-password"
}

resource "aws_db_instance" "example" {
  engine         = "postgres"
  instance_class = "db.t3.micro"
  username       = "admin"
  password       = data.aws_secretsmanager_secret_version.db_password.secret_string
}
resource "aws_instance" "frontend" {
  ami             = "ami-07cb013c9ecc583f0"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.allow_http.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nginx
              sudo systemctl start nginx
              EOF
}

resource "aws_instance" "backend" {
  ami             = "ami-07cb013c9ecc583f0"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.allow_http.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nodejs npm
              git clone https://github.com/example/api-backend.git
              cd api-backend && npm install
              npm start
              EOF
}

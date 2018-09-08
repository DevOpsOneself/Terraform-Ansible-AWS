terraform {
  required_version = ">= 0.8"
}
  
provider "aws" {
  access_key = "${var.access_key}"                          ## modify to your access_key
  secret_key = "${var.secret_key}"
  region = "us-east-1"
}
  
resource "aws_instance" "wso2ei" {
  ami                    = "ami-04681a1dbd79675a5"
  instance_type          = "t2.micro"  
  key_name               = "Ansible"
  vpc_security_group_ids = ["${aws_security_group.gg_security_group.id}"]
  
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  
  tags = {
    Role = "wso2ei"
    Env = "dev"
  }
}
  
resource "aws_security_group" "gg_security_group" {
  name = "gg_security_group"
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
  
output "public_ip" {
  value = "${aws_instance.wso2ei.public_ip}"
}
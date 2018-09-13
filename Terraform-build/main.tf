terraform {
  required_version = ">= 0.8"
}
  
provider "aws" {
  #access_key = "${var.access_key}"                          ## modify to your access_key
  #secret_key = "${var.secret_key}"
  region = "us-east-1"
}

# module "aws_keypair_module" {
#   source  = "modules/aws_keypair_module"
#   key_name = "${var.key_name}"
#   public_key = "${var.public_key}"
# }

resource "aws_instance" "wso2ei" {
  ami                    = "ami-04681a1dbd79675a5"
  instance_type          = "t2.micro"  
  key_name               = "developer"
  vpc_security_group_ids = ["${aws_security_group.gg_security_group.id}"]
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

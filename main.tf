provider "aws" {
  region  = "eu-west-2"
  version = "~> 2.8"
}

data "aws_ami" "amazonlinux" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "helloworld" {
  ami           = data.aws_ami.amazonlinux.id
  instance_type = "t3.micro"
  tags = {
    Name = "Hello-World"
  }
  user_data              = <<EOF
  #!/bin/bash
  yum update -y
  yum install httpd -y
  systemctl start httpd
  echo '<body style=font-family:Roboto,sans-serif;><h2>Hello World,</h2><p>This is your new website created by <a href=https://magnetarconsulting.co.uk >Magnetar IT</a> & Terraform!</p></body>' > /var/www/html/index.html
  EOF
  vpc_security_group_ids = [aws_security_group.helloworld.id]
}

resource "aws_security_group" "helloworld" {
  name        = "Hello World"
  description = "Allow inbound traffic"
  ingress {
    description = "HTTP Inbound"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
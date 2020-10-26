provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "web_server" {
  name = "${var.server_name}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "vm" {
  ami = "ami-02f147dfb8be58a10"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.web_server.id}"]
  associate_public_ip_address = true

  user_data = "${file("apache-start.sh")}"


  tags = {
    Name = "MCM: Apache webserver"
  }
}

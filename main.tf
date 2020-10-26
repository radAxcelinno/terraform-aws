provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "vm" {
  ami = "ami-02f147dfb8be58a10"
  instance_type = "t2.micro"
  associate_public_ip_address = true

  security_groups = ["sg-4e69aa0f"]
  user_data = "${file("apache-start.sh")}"


  tags = {
    Name = "MCM: Apache webserver"
  }
}

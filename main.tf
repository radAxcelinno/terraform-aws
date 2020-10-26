provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "vm" {
  ami = "ami-02f147dfb8be58a10"
  instance_type = "t2.micro"
  security_groups = ["sg-0f515b7d62ffa5499"]
  user_data = "${file("apache-start.sh")}"


  tags = {
    Name = "MCM: Apache webserver"
  }
}

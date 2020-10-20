provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "vm" {
  ami = "ami-07a29e5e945228fa1"
  instance_type = "t2.micro"

  tags = {
    Name = "created from MCM"
  }
}

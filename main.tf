provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "vm" {
  ami = "ami-0ea142bd244023692"
  instance_type = "t2.micro"

  tags = {
    Name = "created from MCM"
  }
}

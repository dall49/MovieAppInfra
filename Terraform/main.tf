
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ubuntu" {
  name        = "ubuntu-security-group"
  description = "Allow HTTP and SSH traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "API"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
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

  tags = {
    Name = "terraform"
  }
}

variable "instance_count" {
  default = "3"
}

resource "aws_instance" "ubuntu" {
  count         = var.instance_count
  ami           = "ami-03d315ad33b9d49c4"
  instance_type = "t2.micro"
  key_name      = "ssh-key"
  

  tags = {
    Name = "server-${count.index}"
  }

  vpc_security_group_ids = [
    aws_security_group.ubuntu.id
  ]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 30
  }
}

resource "aws_eip" "ubuntu" {
  vpc      = true
  count    = var.instance_count
  instance = aws_instance.ubuntu[count.index].id
}

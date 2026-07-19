########################################
# AWS Provider
########################################
provider "aws" {
  region = var.aws_region
}

########################################
# Fetch Latest Ubuntu 22.04 AMI
########################################
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



# data "aws_vpc" "this"{
# }


########################################
# SSH Key Pair
########################################
resource "aws_key_pair" "ansible_key" {
  key_name   = "ansible-key"
  public_key = file(var.public_key_path)
}

########################################
# Security Group (SSH + HTTP)
########################################
resource "aws_security_group" "ansible_sg" {
  name        = "ansible-sg"
  description = "Allow SSH and HTTP access for Ansible-managed EC2"
  #vpc_id = data.aws_vpc.this.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
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
}

########################################
# EC2 Instances (2 Targets for Ansible)
########################################
resource "aws_instance" "ansible_targets" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ansible_key.key_name
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]

  tags = {
    Name = "ansible-managed-${count.index + 1}"
  }
}


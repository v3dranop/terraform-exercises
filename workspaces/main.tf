### Terraform Workspace commands:
/*
terraform workspace -h
terraform workspace show
terraform workspace new dev
terraform workspace new prod
terraform workspace new test
terraform workspace list
terraform workspace select dev
*/

# Create a VPC
resource "aws_vpc" "app_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "app-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "vpc_igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "kp" {
  key_name   = "myKey2"
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey2.pem"
  }
}

resource "aws_instance" "ec2_instance" {
  ami             = "ami-09d3b3274b6c5d4aa"
  instance_type   = lookup(var.team, terraform.workspace)
  key_name        = "myKey2"
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.sg.id]

  tags = {
    Name = "workspace_instance"
  }

  volume_tags = {
    Name = "workspace_instance"
  }
}

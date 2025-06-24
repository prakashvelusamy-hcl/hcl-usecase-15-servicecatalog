###This Terraform code will create the following resources in the us-east-1 region:

###A VPC with a CIDR block of 10.0.0.0/16

###A public subnet and a private subnet, each in a different availability zone.

###An internet gateway and a public route table associated with the public subnet.

###A security group for the EC2 instance, allowing inbound traffic on port 80 and outbound traffic on all ports.

###An EC2 instance in the public subnet running the Amazon Linux 2 AMI.

###An RDS instance in the private subnet, using the MySQL engine version 5.7 and a db.t2.micro instance class.
###Note that the RDS instance password is hardcoded in this example, which is not a recommended practice. In a production environment, you should store the password securely in a secrets management service like AWS Secrets Manager.
###Also, please remember to replace the AMI ID with the latest Amazon Linux 2 AMI ID for the us-east-1 region.


provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "My VPC"
  }
}

# Create public and private subnets
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private Subnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private Subnet2"
  }
}

resource "aws_subnet" "private_subnet3" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Private Subnet3"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

# Create a route table for the public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "public_subnet_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Create a security group for the EC2 instance
resource "aws_security_group" "ec2_sg" {
  name   = "EC2 Security Group"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance in the public subnet
resource "aws_instance" "web_server" {
  ami           = "ami-0b09627181c8d5778" # Amazon Linux 2023 AMI 2023.4.20240528.0 x86_64 HVM kernel-6.1
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

     tags = {
       Name = "web_instance"
     }

     user_data = <<-EOF
                 #!/bin/bash
                 yum update -y
                 yum install -y httpd
                 systemctl start httpd
                 systemctl enable httpd
                 echo "Hello, World" > /var/www/html/index.html
                 EOF
}
resource "aws_eip" "web_server" {
  instance = aws_instance.web_server.id
  domain   = "vpc"
}

# Create an RDS instance in the private subnet
resource "aws_db_subnet_group" "private_subnets" {
  name       = "private-subnets"
  subnet_ids = [aws_subnet.private_subnet1.id,aws_subnet.private_subnet2.id]
}

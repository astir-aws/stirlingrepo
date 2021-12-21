# Create VPC
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.aws-vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name      = "john-vpc"
    Terraform = "true"
  }
}

# Create Internet Gateway and attach it to vpc
# terraform create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "john-IGW"
  }
}

# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "pub-sb-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub-sb-1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-sb-1"
  }
}

# Create Public Subnet 2
# terraform aws create subnet
resource "aws_subnet" "pub-sb-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub-sb-2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-sb-2"
  }
}

# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "pri-sb-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri-sb-1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "pri-sb-1 | app tier"
  }
}

# Create Private Subnet 2
# terraform aws create subnet
resource "aws_subnet" "pri-sb-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri-sb-2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "pri-sb-2 | app tier"
  }
}


# Create Private Subnet 3
# terraform aws create subnet
resource "aws_subnet" "pri-sb-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri-sb-3-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "pri-sb-3 | database tier"
  }
}

# Create Private Subnet 4
# terraform aws create subnet
resource "aws_subnet" "pri-sb-4" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri-sb-4-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "pri-sb-4 | database tier"
  }
}


# Create Route Table and Associate with Public Route
# terraform create route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public route table"
  }
}

# Associate Public Subnet 1 to " public route table"
# terraform aws associate subnet with route table 
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id      = aws_subnet.pub-sb-1.id
  route_table_id = aws_route_table.public-route-table.id
}

# Associate Public Subnet 2 to " public route table"
# terraform aws associate subnet with route table 
resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  subnet_id      = aws_subnet.pub-sb-2.id
  route_table_id = aws_route_table.public-route-table.id
}


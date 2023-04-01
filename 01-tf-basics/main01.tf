terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_vpc" "name" {
  cidr_block = "10.10.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support = true
    
}

resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  
}

resource "aws_subnet" "publicsubnet" {
  cidr_block = "10.10.0.0/25"
  vpc_id = aws_vpc.name.id
  
}

resource "aws_route_table" "customRT" {
  vpc_id = aws_vpc.name.id
  
  
}

resource "aws_route" "name" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.name.id
  route_table_id = aws_route_table.customRT.id
  
}

resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.customRT.id
  subnet_id = aws_subnet.publicsubnet.id
  
}
resource "aws_vpc" "mycustomvpc" {
    cidr_block = "10.10.0.0/24"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      "name" = "mycustomvpc"
    }
  
}

resource "aws_internet_gateway" "customigw" {
    vpc_id = aws_vpc.mycustomvpc.id
    tags = {
      "name" = "customigw"
    }
  
}

resource "aws_internet_gateway_attachment" "name" {
    internet_gateway_id = aws_internet_gateway.customigw.id
    vpc_id = aws_vpc.mycustomvpc.id
  
}

resource "aws_subnet" "Publicsubnet" {
    cidr_block = "10.10.0.0/25"
    vpc_id = aws_vpc.mycustomvpc.id
    availability_zone = "us-east-1a"
    tags = {
      "name" = "Publicsubnet"
    }
  
}

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.mycustomvpc.id
  
}

resource "aws_route" "name" {
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.customigw.id
    route_table_id = aws_route_table.name.id
  
}

resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.Publicsubnet.id
    route_table_id = aws_route_table.name.id
  
}

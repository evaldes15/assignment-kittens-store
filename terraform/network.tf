data "aws_availability_zones" "availability_zones" {
    state = "available"
}

resource "aws_vpc" "app_vpc" {
    cidr_block              = var.vpc_cidr_range
    enable_dns_hostnames    = true
    tags = {
      Name : var.vpc_name
    }
}

resource "aws_internet_gateway" "app_internet_gateway" {
    vpc_id = aws_vpc.app_vpc.id
}

resource "aws_subnet" "app_subnets" {
    count                   = length(var.subnets)
    map_public_ip_on_launch = true
    availability_zone       = data.aws_availability_zones.availability_zones.names[count.index]
    cidr_block              = var.subnets[count.index]
    vpc_id                  = aws_vpc.app_vpc.id

    tags = {
        Name = "app_route_table_${count.index + 1}"
        "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    }
}

resource "aws_route_table" "app_route_tables" {
    count  = length(var.subnets)
    vpc_id = aws_vpc.app_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.app_internet_gateway.id
    }
    tags = {
        Name = "app_route_table_${count.index + 1}"
    }
}

resource "aws_route_table_association" "route_table_association" {
    count           = length(var.subnets)
    route_table_id  = aws_route_table.app_route_tables[count.index].id
    subnet_id       = aws_subnet.app_subnets[count.index].id
}
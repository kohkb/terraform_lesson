# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.service}-${var.env}-vpc"
  }
}

# public subnet
resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_a_cidr
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${var.service}-${var.env}-public-a"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_c_cidr
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.service}-${var.env}-public-c"
  }
}

resource "aws_subnet" "public_d" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_d_cidr
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "${var.service}-${var.env}-public-d"
  }
}

# private subnet
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_a_cidr
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${var.service}-${var.env}-private-a"
  }
}


resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_c_cidr
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.service}-${var.env}-private-c"
  }
}

resource "aws_subnet" "private_d" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_d_cidr
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "${var.service}-${var.env}-private-d"
  }
}

#IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.service}-${var.env}-igw"
  }
}

#EIP
resource "aws_eip" "eip_a" {
  vpc = true

  tags = {
    Name = "${var.service}-${var.env}-eip-a"
  }
}

resource "aws_eip" "eip_c" {
  vpc = true

  tags = {
    Name = "${var.service}-${var.env}-eip-c"
  }
}

resource "aws_eip" "eip_d" {
  vpc = true

  tags = {
    Name = "${var.service}-${var.env}-eip-d"
  }
}


#NAT
resource "aws_nat_gateway" "nat_a" {
  allocation_id = "${aws_eip.eip_a.id}"
  subnet_id     = "${aws_subnet.private_a.id}"

  tags = {
    Name = "${var.service}-${var.env}-nat-a"
  }
}

resource "aws_nat_gateway" "nat_c" {
  allocation_id = "${aws_eip.eip_c.id}"
  subnet_id     = "${aws_subnet.private_c.id}"

  tags = {
    Name = "${var.service}-${var.env}-nat-c"
  }
}

resource "aws_nat_gateway" "nat_d" {
  allocation_id = "${aws_eip.eip_d.id}"
  subnet_id     = "${aws_subnet.private_d.id}"

  tags = {
    Name = "${var.service}-${var.env}-nat-d"
  }
}

#Route Table for public pubnet
resource "aws_route_table" "route_public_a" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = var.route_table_cidr
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.service}-${var.env}-route-public-a"
  }
}

resource "aws_route_table_association" "route_association_public_a" {
  subnet_id      = "${aws_subnet.public_a.id}"
  route_table_id = "${aws_route_table.route_public_a.id}"
}

resource "aws_route_table" "route_public_c" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = var.route_table_cidr
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.service}-${var.env}-route-public-c"
  }
}

resource "aws_route_table_association" "route_association_public_c" {
  subnet_id      = "${aws_subnet.public_c.id}"
  route_table_id = "${aws_route_table.route_public_c.id}"
}

resource "aws_route_table" "route_public_d" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = var.route_table_cidr
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "${var.service}-${var.env}-route-public-d"
  }
}

resource "aws_route_table_association" "route_association_public_d" {
  subnet_id      = "${aws_subnet.public_d.id}"
  route_table_id = "${aws_route_table.route_public_d.id}"
}

#Route Table for private subnet
resource "aws_route_table" "route_private_a" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = var.route_table_cidr
    nat_gateway_id = "${aws_nat_gateway.nat_a.id}"
  }

  tags = {
    Name = "${var.service}-${var.env}-route-private-a"
  }
}

resource "aws_route_table_association" "route_association_private_a" {
  subnet_id      = "${aws_subnet.private_a.id}"
  route_table_id = "${aws_route_table.route_private_a.id}"
}

resource "aws_route_table" "route_private_c" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = var.route_table_cidr
    nat_gateway_id = "${aws_nat_gateway.nat_c.id}"
  }

  tags = {
    Name = "${var.service}-${var.env}-route-private-c"
  }
}

resource "aws_route_table_association" "route_association_private_c" {
  subnet_id      = "${aws_subnet.private_c.id}"
  route_table_id = "${aws_route_table.route_private_c.id}"
}

resource "aws_route_table" "route_private_d" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = var.route_table_cidr
    nat_gateway_id = "${aws_nat_gateway.nat_d.id}"
  }

  tags = {
    Name = "${var.service}-${var.env}-route-private-d"
  }
}

resource "aws_route_table_association" "route_association_private_d" {
  subnet_id      = "${aws_subnet.private_d.id}"
  route_table_id = "${aws_route_table.route_private_d.id}"
}

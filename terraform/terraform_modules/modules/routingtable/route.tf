#######Routing table Configuration####################

####Elastic IP resource ####

resource "aws_eip" "nt" {

  vpc      = true
}


###Internet gateway ####
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "igw_public_rt"
  }
}

### NAT Gateway###

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nt.id
  subnet_id     = var.public1

  tags = {
    Name = "gw NAT"
  }
}



####public routing table####

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-public-rt"

  }

}


#### public association subnet routing table ####

resource "aws_route_table_association" "public_subnet1" {


  subnet_id      = var.public1
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet2" {


  subnet_id      = var.public2
  route_table_id = aws_route_table.public.id
  
}



#####Private routing table with NAT Gateway ####

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.environment}-private-rt"
  }

}


######## private subnet association in routing table with NAT#######

resource "aws_route_table_association" "private_subnet1" {


  subnet_id      = var.private1
  route_table_id = aws_route_table.private.id

}


resource "aws_route_table_association" "private_subnet2" {


  subnet_id      = var.private2
  route_table_id = aws_route_table.private.id

}


#####Private routing table w/o NAT ###

resource "aws_route_table" "private1" {

  vpc_id = var.vpc_id


  tags = {
    Name = "${var.environment}-private1-rt"
  }

}



#### private subnet w/o NAT routing table####

resource "aws_route_table_association" "private_subnet3" {

  subnet_id      = var.private3
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private_subnet4" {

  subnet_id      = var.private4
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private_subnet5" {

  subnet_id      = var.private5
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private_subnet6" {

  subnet_id      = var.private6
  route_table_id = aws_route_table.private1.id
}


resource "aws_subnet" "public1" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${var.environment}-public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.environment}-public2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${var.environment}-private1"
  }
}


resource "aws_subnet" "private2" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.environment}-private2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.environment}-private3"
  }
}


resource "aws_subnet" "private4" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "10.0.5.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "${var.environment}-private4"
  }
}

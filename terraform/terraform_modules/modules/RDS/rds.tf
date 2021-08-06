resource "aws_db_subnet_group" "private_subnets" {
  name       = "${var.environment}-private_subnets-db-rds-mysal"
  subnet_ids = [var.private1]
}

resource "aws_db_parameter_group" "db_parameter-mysql" {
  name   = "${var.environment}-pg-rds-mysql"
  family = "mysql5.7"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}



resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "root"
  password             = "root123"
  parameter_group_name = aws_db_parameter_group.db_parameter-mysql
  skip_final_snapshot  = true
  security_group_names = [ "" ]
  db_subnet_group_name = aws_db_subnet_group.private_subnets.name
}

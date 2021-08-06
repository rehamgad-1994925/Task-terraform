resource "aws_instance" "App1" {
  
  ami = "ami-02b4e72b17337d6c1"
  instance_type = "t2.micro"
  /*vpc_id = "${var.vpc_id}" */
  subnet_id = var.private1
  security_groups = var.sg_web_id
  
  
  tags = {
    Name = "${var.Name_tag}-${var.number}- App1- ec2"
  }
}


resource "aws_instance" "App2" {
  
  ami = "ami-02b4e72b17337d6c1"
  instance_type = "t2.micro"
  /*vpc_id = "${var.vpc_id}" */
  subnet_id = var.private2
  
  security_groups = var.sg_web_id
  
  tags = {
    Name = "${var.Name_tag}-${var.number}-App2 ec2"
  }
}


resource "aws_instance" "Bastion" {
  
  ami = "ami-02b4e72b17337d6c1"
  instance_type = "t2.micro"
  /* vpc_id = "${var.vpc_id}" */
  subnet_id = var.public1
  
  security_groups = var.sg_bastion_id
  
  tags = {
    Name = "bastion_server"
  }
}





#### security group for loadbalancer ####

resource "aws_security_group" "LB" {
  name = "LB-node"
  description = "Loadbalancer Security Group"
  vpc_id =  "${var.vpc_id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 /* ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  */ 

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
tags = {
    
    Name = "${var.environment}- sg-http-lb"
  }
}


#### security group rule for private subnet  #####
resource "aws_security_group" "web" {
  name = "${var.environment}-sg-ec2-app"
  description = "web Security Group"
  vpc_id =  "${var.vpc_id}"

 ingress {
 
    description = "allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh "
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
tags = {
    
    Name = "${var.environment} -sg-http-app"
  }
}


#### security group rule for basition server  #####
resource "aws_security_group" "bastion" {
  name = "${var.environment}-sg-ec2-bastion"
  description = "bastion Security Group"
  vpc_id =  "${var.vpc_id}"

 ingress {
 
    description = "allow http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
tags = {
    
    Name = "${var.environment} -sg-http-bastion"
  }
}


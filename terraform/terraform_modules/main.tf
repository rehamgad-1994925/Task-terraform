 #### VPC Module ####
 
 module "vpc_module"  {
    
    source = "/home/ec2-user/environment/terraform/terraform_modules/modules/vpc"
    
name =   var.name
environment = var.environment
vpc_cidr_block = var.vpc_cidr_block

 }
### Subnet module####

module "subnet_module" { 

    source = "/home/ec2-user/environment/terraform/terraform_modules/modules/subnets"
    
vpc_id = module.vpc_module.vpc_id
environment  = var.environment

}


#### route Module ####

module "route" {

source = "/home/ec2-user/environment/terraform/terraform_modules/modules/routingtable"

environment  = var.environment

vpc_id = module.vpc_module.vpc_id 

/*subnet_id = module.subnet_module.subnets*/


public1  = module.subnet_module.public1_subnet
public2  = module.subnet_module.public2_subnet
private1 = module.subnet_module.private1_subnet 
private2 = module.subnet_module.private2_subnet 
private3 = module.subnet_module.private3_subnet
private4 = module.subnet_module.private4_subnet
private5 = module.subnet_module.private5_subnet
private6 = module.subnet_module.private6_subnet


 }
####security group module #####

module "SG" {

source = "/home/ec2-user/environment/terraform/terraform_modules/modules/securitygroup"

vpc_id = module.vpc_module.vpc_id  
environment =var.environment


}
### ec2 module ####

module "instance_module" {

source = "/home/ec2-user/environment/terraform/terraform_modules/modules/ec2"

vpc_id = module.vpc_module.vpc_id 
Name_tag = var.Name_tag
number = var.number
sg_web = module.SG.sg_web
sg_bastion = module.SG.sg_bastion
private1 = module.subnet_module.private1_subnet
private2 = module.subnet_module.private2_subnet
public1 = module.subnet_module.public1_subnet
sg_web_id = module.SG.sg_web_id
sg_bastion_id = module.SG.sg_bastion_id

}

#### ALB module ######

module "ALB" {

source = "/home/ec2-user/environment/terraform/terraform_modules/modules/ALB"

vpc_id = module.vpc_module.vpc_id   
environment = var.environment
public1 = module.subnet_module.public1_subnet
public2 = module.subnet_module.public2_subnet
App1 = module.instance_module.App1
App2 = module.instance_module.App2
LB = module.SG.LB

}


#### RDS Module ####
module "RDS" {

source = "/home/ec2-user/environment/terraform/terraform_modules/modules/RDS"

environment = var.environment 
private1 = module.subnet_module.private1_subnet

}

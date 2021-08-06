output "sg_web"{
    
    value = aws_security_group.web
    
}


output "sg_bastion"{
    
    value = aws_security_group.bastion
    
}


output "LB"{
    
    value = aws_security_group.LB
    
}


output "sg_web_id"{
    
    value = aws_security_group.web.id
    
}

output "sg_bastion_id"{
    
    value = aws_security_group.bastion.id
    
}



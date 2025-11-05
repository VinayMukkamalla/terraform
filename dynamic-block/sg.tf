resource "aws_security_group" "terraform_security_group"{
    name = "roboshop-strict-sg" 
    egress {
      
      from_port  = 0  # 0 means allow all ports alls ports
      to_port    = 0
      protocol   = "-1"  # all protocols
      cidr_blocks = ["0.0.0.0/0"]

    }

    dynamic ingress {
      for_each = toset(var.list)
      content {
        from_port  = ingress.value  # 0 means allow all ports alls ports
        to_port    = ingress.value
        protocol   = "tcp"  # all protocols
        cidr_blocks = ["0.0.0.0/0"]
      }
      

    }


    tags = { 
       
       Name = "roboshop-strict-sg"
    
    } 

  # ingress = []
  # egress = []

}
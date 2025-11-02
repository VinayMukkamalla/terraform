resource "aws_instance" "terraform" {
  count         = 4
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]

  tags = {
    Name = "${var.instances[count.index]}"
    Value = "True"
  }
}

resource "aws_security_group" "terraform_security_group"{
    name = "allow_all_traffic"  # security group name
    # description = ""
    # vpc_id = ""

    egress {
      
      from_port  = 0  # 0 means allow all ports alls ports
      to_port    = 0
      protocol   = "-1"  # all protocols
      cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {
      
      from_port  = 0  # 0 means allow all ports alls ports
      to_port    = 0
      protocol   = "-1"  # all protocols
      cidr_blocks = ["0.0.0.0/0"]

    }


    tags = {  # name
       
       Name = "allow_all_tags"
    
    } 

  # ingress = []
  # egress = []

}
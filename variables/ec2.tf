resource "aws_instance" "terraform" {

  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "terraform_security_group"{
    name = var.sg_name  # security group name
    # description = ""
    # vpc_id = ""

    egress {
      
      from_port  = var.egress_from_port  # 0 means allow all ports alls ports
      to_port    = var.egress_to_port
      protocol   = "-1"  # all protocols
      cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {
      
      from_port  = var.ingress_from_port  # 0 means allow all ports alls ports
      to_port    = var.ingress_to_port
      protocol   = "-1"  # all protocols
      cidr_blocks = var.cidr_block

    }


    tags = var.sg_tags #Name

  # ingress = []
  # egress = []

}
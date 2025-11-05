resource "aws_instance" "terraform" {
  ami           = local.ami_id #data.aws_ami.aminame.id from data.tf also used in locals
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]

  tags = local.ec2_tags
}

resource "aws_security_group" "terraform_security_group"{
    name = "${local.common_name}-allow_all_traffic"  # security group name
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
resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]

  tags = {
    Name = "terraform"
    Value = "True"
  }

  provisioner "local-exec"{

    command = "echo ${self.private_ip} > inventory.ini"
    on_failure = continue # if the provisioner fails at run runtime terrafom will mark the resource as tainted and the next time you run terraform apply terraform will destroy the tainted resource and create the resouce again to override this behaviour we use on_failure = continue
  }

  provisioner "local-exec" {
    
    command = "echo instance is destroyed"
    when = destroy  # bydefault provisioner run at create means apply if we define when = destroy this provisioner block will run at destroy time
  }

  
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip

  }
 

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo systemctl stop nginx",
      "echo 'successfully stopped nginx server' "
    ]
    when = destroy
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
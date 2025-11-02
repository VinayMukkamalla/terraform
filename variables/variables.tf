variable "ami"{

  default = "ami-09c813fb71547fc4f"
}

variable "instance_type"{

  default = "t3.micro"

}

variable "ec2_tags"{
  type = map 
  default ={

    Name = "terraform"
    description = "using terraform variables"
    Value = "True"

  }
}

variable "sg_name"{
  type = string
  default = "allow_all_traffic"

}

variable "egress_from_port"{
  type = number
  default = 0
}
variable "egress_to_port"{
  type = number
  default = 0
}

variable "ingress_from_port"{
  type = number
  default = 0
}
variable "ingress_to_port"{
  type = number
  default = 0
}

variable "cidr_block"{
  type = list
  default = ["0.0.0.0/0"]

}

variable "sg_tags"{
  type = map
  default = {  
       
       Name = "allow_all_tags"
    
    } 
}


# terrafor data types : string, number, list, map, bool  
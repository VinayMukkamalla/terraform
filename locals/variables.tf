variable "project"{

  default = "roboshop"
}

variable "env"{

  default = "dev"
}

# variable "common_tags"{

#   default = "${var.project}-${var.env}"
# }

variable "ami"{

  default = "ami-09c813fb71547fc4f"
}

variable "instance_type"{

  default = "t3.micro"

}

variable "common_tags"{
  type = map 
  default ={
    #Name = "terraform"
    Terraform = "true"
    project  = "roboshop"
    env     = "dev"

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
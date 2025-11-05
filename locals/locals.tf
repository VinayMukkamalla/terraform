locals {
  instance_type = "t3.micro"
  common_name = "${var.project}-${var.env}"
  ami_id= data.aws_ami.aminame.id
  ec2_tags = merge(
    var.common_tags,
    {
      Name = local.common_name
    }
  )
}


# locals are like variables with some extra capabilities
# locals  are permanent they cannot be overridden 
# variable cannot be accessed inside another variable
# variables can be accessed inside locals
# local variable can be accessed using local.variablename 


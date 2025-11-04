locals {
  instance_type = "t3.micro"
}

# locals are like variables with some extra capabilities
# locals  are permanent they cannot be overridden 
# variable cannot be accessed inside another variable
# variables can be accessed inside locals
# local variable can be accessed using local.variablename 

locals {
  common_name = ${var.}
}
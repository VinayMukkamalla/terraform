# case 1: convert list to map using toset([]) and use the list items as each.value instead of directly using as list by list.count.index

#for_each = toset(var.instances)  --> each.value 

# case 2: directly using map by each.key and each.value
# variable "instances"{
#  default = {
#  {
#   instance1 : "mongodb",
#   instance2 : "redis"
  
#   } 
  
#   } 

# for_each = var.instances ;   each.key --> instance1 ; each.value --> mongodb etc
# for_each respects map or set([])


variable "instances"{
  default = ["mongodb","redis","mysql","rabbitmq"]
}

variable "zone_id" {
  default = "Z07155921YL2PZLNGBCDC"
}

variable "domain_name" {
  default = "vinaymukkamalla.fun"
}
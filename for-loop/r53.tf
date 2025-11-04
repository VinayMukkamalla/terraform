resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.terraform
  #count = 4
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 60
  records = [each.value.private_ip]
  allow_overwrite = true 

}
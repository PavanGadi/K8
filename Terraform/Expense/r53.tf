resource "aws_route53_record" "Expense" {
  zone_id = var.zone_id
  count = length(var.instance_names)
#  below we are giving in flower brackets to make sure it is considered as varible instead of Text.
  name  = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names [count.index]}.${var.domain_name}"
  ttl   = 1
  type  = "A"
#   below condition is if instance is front end public ip will be taken, else private ip will be taken
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
}
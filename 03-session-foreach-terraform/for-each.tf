resource "aws_instance" "nishal"{

    for_each = var.instances
    ami = var.ami_id 
    instance_type = each.value              #it will refer the instance value i.e, t2 or t3
    tags = {
        Name = each.key                     #it will refer teh instances names 
    }
    
    


}

output "aws_info"{

    value = aws_instance.nishal
}

#if web give public or else private

resource "aws_route53_record" "record" {

  for_each = aws_instance.nishal 
  zone_id = var.zone_id
  name    = "${each.key}.${var.zone_name}"
  type    = "A"
  ttl     = 1
  records = [ each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}
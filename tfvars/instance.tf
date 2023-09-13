resource "aws_instance" "nishal"{

    for_each = var.instances
    ami = var.ami_id 
    instance_type = each.value    
    tags = {
        Name = each.key                     
    }
    
}

resource "aws_route53_record" "record" {

  for_each = aws_instance.nishal 
  zone_id = var.zone_id
  name    = "${each.key}.${var.zone_name}"
  type    = "A"
  ttl     = 1
  records = [ each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}


resource "aws_security_group" "allow_freetraffic"{

      name        = var.sg_name
      description = var.description

        ingress {
            description      = "Allowing all traffic"
            from_port        = 0
            to_port          = 0
            protocol         = "tcp"
            cidr_blocks      = var.sg_cidr
        
    }
    #outbound
        egress {
            from_port        = 0
            to_port          = 0
            protocol         = "-1" #all protocols
            cidr_blocks      = var.sg_cidr
        
        }


    }
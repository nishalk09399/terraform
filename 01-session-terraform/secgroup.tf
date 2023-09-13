resource "aws_security_group" "allow_freetraffic"{

      name        = "var.sg_name"
      description = "var.description"

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
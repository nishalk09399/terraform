data "aws_ami" "ami_id" {
  most_recent = true
  owners = ["617766776617"]  #1. give the aws AMI ID or self, here we are fetching our devops-practice AMI ID

  filter {
    name   = "name"
    values = ["devops-practice"]
  }
}


output ami_id {

    value = data.aws_ami.ami_id.id

}

#*************************** 2. here we are fetching AWS Linux 2 AMI ID******************************

data "aws_ami" "ami_idd" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-*.0-x86_64-gp2"]
    }
}

# 3. ******************this to fetch the default VPC info**************************************

data "aws_vpc" "default" {
    default = true
}


output "vpc_info" {

    value = data.aws_vpc.default

}

#4. ******************this to create the SG by using default VPC **************************************

resource "aws_security_group" "allow_freetraffic"{

      name        = "free"
      description = "var.description"
      vpc_id = "data.aws_vpc.default"

        ingress {
            description      = "Allowing all in-bound traffic"
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        
    }
    #outbound
        egress {
            from_port        = 0
            to_port          = 0
            protocol         = "-1" #all protocols
            cidr_blocks      = ["0.0.0.0/0"]
        
        }


    }
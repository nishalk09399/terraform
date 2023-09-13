

#this below script is use to create the ec2 instance automatically 

#resource "aws_instance" "nishal"{

    #ami = "ami-081609eef2e3cc958" #this is the ami of devops-practice siva's
    #instance_type = "t2.micro"
#}


#this below script is use to create the ec2 instance and SG automatically 

resource "aws_instance" "nishal"{

    ami = var.ami_id 
    instance_type = var.instance_type
    security_groups = [aws_security_group.allow_freetraffic.name]

    tags = var.tags
}


   
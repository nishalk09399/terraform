variable "ami_id" {

     type = string                      
     default = "ami-081609eef2e3cc958"  
     

}

variable "instance_type" {

     type = string                      
     default =  "t3.micro" 
}

variable "instances"{

    type = map
    default = {

        mongoDB = "t3.micro" #mongoDB is each.key and t3.micro is each.value
        cart = "t2.micro"
        user = "t2.micro"
        catalogue = "t2.micro"
        shipping = "t2.micro"
        payement = "t2.micro"
        redis  = "t2.micro"
        mysql = "t3.micro"
        rabbitmq = "t2.micro"
        web = "t2.micro"

    }
    
}

# we are declaring route 53 records

variable "zone_id" {

                        
     default =  "Z07869251AQBK6AKJKM03" 
}

variable "zone_name" {

    default =  "nishaldevops.online" 
}

#creating list for the dynamic block 

variable "ingress" {
     type = list
     default = [
        {
        
        description = "allowing port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

        }, 

      { 
        description = "allowing port 440"
        from_port = 440
        to_port = 440
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

        }, 

    { 
        description = "allowing port 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

        }


     ]



     


}

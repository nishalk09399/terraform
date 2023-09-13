variable "ami_id" {

     type = string                      
     default = "ami-081609eef2e3cc958"  
     

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

variable "sg_name" {

                          
     default =  "allow_freetraffic" 
}

variable "description" {

     type = string                      
     default =  "allowing all the traffic from all the directions" 
}

variable "sg_cidr" {

     type = list                     
     default = ["0.0.0.0/0"] 
}

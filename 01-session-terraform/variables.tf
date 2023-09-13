variable "ami_id" {

     type = string                      #this is the datatypes
     default = "ami-081609eef2e3cc958"  #this is default value
     

}

variable "instance_type" {

     type = string                      
     default =  "t3.micro" 
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
  
variable "tags" {

     type = map        #map having the flower braces like this              
     default =  {

          Name = "MongoDB"
          Environment = "DEV"
          Terraform = "true"
          Project = "Roboshop"
          Component = "MongoDB"

     }
}
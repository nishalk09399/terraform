
variable "ami_id" {

     type = string                      #this is the datatypes
     default = "ami-081609eef2e3cc958"  #this is default value
     
    }

variable "instance_names" {
    type = list
    default = ["MongoDB", "Cart", "User", "Catalogue", "Shipping", "Payment", "Redis", "Mysql", "Rabbitmq", "Web"]
    

}

#variables for route53 records

variable "zone_id" {

    default = "Z07869251AQBK6AKJKM03"
}

variable "domain" {

    default = "nishaldevops.online"
}
locals {

                                                                        
ami_id = "ami-081609eef2e3cc958" 
public_key = file("${path.module}/nishal.pub") #capable to run functions and conditions as well in local
instance_type = var.isPROD ? "t3.micro" : "t2.micro"
}

module "ec2" {

    source = "../terraform-modules-ec2" #this is the child folder we are calling tht child folder code here to execute
    ami_id = "ami-081609eef2e3cc958"
    instance_type = "t2.micro"

}
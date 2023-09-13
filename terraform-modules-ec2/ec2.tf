resource "aws_instance" "moduler_instance"{
    
    ami = var.ami_id 
    instance_type = var.instance_type  
    tags = {
    Name = "Nishal"
  }
}

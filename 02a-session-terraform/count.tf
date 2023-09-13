resource "aws_instance" "conditionsdemo" {
    count = 10 # to get the 10 instances at a time
    ami = var.ami_id

    #below we are implementing that if the instance is mysql or mongodb it should create t3 or else t2

    instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "Mysql" ? "t3.medium" : "t2.micro"
    

    tags = {
        
        Name = var.instance_names[count.index]
    }
}

#mongodB, cart, user, catalogue, shipping, payement, redis, mysql, rabbitmq, web

# to create the route 53 records 

resource "aws_route53_record" "records" {
  count = 10
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain}" #here we are mixing string and varible 
  type    = "A"
  ttl     = 1
  records = [aws_instance.conditionsdemo[count.index].private_ip]
}

# this is to create the keypair pubkey by using filesystem in AWS

resource "aws_key_pair" "deployer" {
  key_name   = "Jawan"
  public_key = file("${path.module}/nishal.pub")
}

#here we are creating the instance using the above keypair pub key_name

resource "aws_instance" "filefunctionexp" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name

}

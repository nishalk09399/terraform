# this will give you the pub ip of instance in console

output "public_ip" {

    value = aws_instance.nishal.public_ip
}
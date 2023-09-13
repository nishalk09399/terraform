output "private_ip" {

    value = aws_instance.conditionsdemo[*].private_ip   #here we are telling that to display the private ips of all instance

}
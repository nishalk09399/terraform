
# this is to create the keypair pubkey by using filesystem "local function" in AWS

resource "aws_key_pair" "deployer" {
  key_name   = "Jawannnn"
  public_key = local.public_key
}

#here we are creating the instance using the above keypair pub key_name

resource "aws_instance" "filefunctionexp" {
    ami = local.ami_id
    #instance_type = var.isPROD ? "t3.micro" : "t2.micro"
    instance_type = local.instance_type
    key_name = aws_key_pair.deployer.key_name
    

}

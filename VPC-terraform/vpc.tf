#here we are creating VPC, subenets, IGW, routetable (12-09-2023)

resource "aws_vpc" "roboshop" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "roboshop"
    Environment = "DEV"
    Terraform = "true"
  }
}

#below to create the subnets

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "roboshop-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.roboshop.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "roboshop-private-subnet"
  }
}

#below is to create the IGW attach to VPC

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.roboshop.id

  tags = {
    Name = "Roboshop-IGW"
  }
}

#below is to create the route tables
#public route table will have IGW to be attached 

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.roboshop.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}


resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.roboshop.id

  tags = {
    Name = "private-route-table"
  }
}

#below we are associating public route with pub subenets and private route with private subnets

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-route-table.id
}


#create one security group and open only port no.8 to public, 22 to open from yourlaptop

resource "aws_security_group" "allow_all" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.roboshop.id

    ingress {
        description      = "HTTP from internet"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }

    ingress {
        description      = "SSH from internet"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["49.37.158.116/32"]
    
  }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }


  tags = {
    Name = "allow_all"
  }
}

#below we can create once ec2 instance

resource "aws_instance" "nishal"{

    ami = "ami-081609eef2e3cc958" 
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    associate_public_ip_address = true

    tags = {

        Name = "Web-instance"
   }
}
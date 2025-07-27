provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "my_vm" {
    ami = var.my_ami
    instance_type = var.my_type

    tags = {
      Name = "Suraj_vm"
    }
  
}

resource "aws_security_group" "my_sg" {
    name = "my_group"
   description = "this is my new group"

   tags = {
     Name = "Suraj_sg"
   }
}

resource "aws_vpc_security_group_ingress_rule" "my_rule" {
  security_group_id = aws_security_group.my_sg.id
  ip_protocol = "tcp"
  cidr_ipv4 = var.my_ingress
  from_port = var.ssh_port
  to_port = var.ssh_port

  tags = {
    Name = "INBOUND_RULE"
  }
}

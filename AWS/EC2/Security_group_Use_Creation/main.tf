# #    *******Ceating Instance Using Existing Security Group************

# resource "aws_instance" "creating_instance_using_existing_security_group" {
#   ami = "ami-0861f4e788f5069dd"
#   instance_type = "t2.nano"
#   tags = {
#     Name = "new instance"
#   }
#   vpc_security_group_ids = ["sg-018a960e2abea2ddc"]
# }
# # *******************************************************************************************************************




# #    ********** Ceating Instance Using Existing Key Pairs **********

# resource "aws_instance" "creating_instance_using_existing_security_group" {
#   ami = "ami-0861f4e788f5069dd"
#   instance_type = "t2.nano"
#   tags = {
#     Name = "new instance"
#   }
#   key_name = "mumbaikey"
# }
# # *******************************************************************************************************************




# #    ********** Creating Security Group ****************

data "aws_vpc" "main" {
    id = "vpc-051aeb7a5b4449c91"
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = data.aws_vpc.main.id
  tags = {
    Name = "new security group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = data.aws_vpc.main.cidr_block
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}





# # task:-     ek hi resource k use krke multiple port allow kaise kre 
resource "aws_instance" "firstInstance" {
  ami = "ami-0861f4e788f5069dd"
  instance_type = "t2.nano"
  tags = {
    Name = "By terraform"
  }
}
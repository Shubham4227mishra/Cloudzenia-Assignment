resource "aws_instance" "ec2" {
  count         = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private[count.index].id
  user_data     = file("nginx-userdata.sh")
}


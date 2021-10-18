resource "aws_instance" "server1" {
  ami               = "ami-0747bdcabd34c712a"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  key_name          = "terra-key"
  vpc_security_group_ids   = ["${aws_security_group.ssh-allowed.id}"]
  subnet_id         = "${aws_subnet.prod-subnet-public-1.id}"

  root_block_device {
    delete_on_termination = false
    volume_size           = 15
    volume_type           = "gp2"
  }
}
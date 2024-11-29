
#providing data sources for ami
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["${var.ownername}"]

  filter {
    name   = "name"
    values = ["${var.image-name}"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#automation of ec2-instance
resource "aws_instance" "aws-ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance-type
  key_name                    = aws_key_pair.key-pair-ec2.key_name #assinging key-pair to an instance
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.security-group-ec2.id}"]
  tags = {
    Name = "aws-ec2-tf"
  }

  user_data = file("${path.module}/userData.sh")

}

output "elastic-ip" {
  value = aws_eip.nodejs.public_ip
}
output "image-id" {
  value = aws_instance.aws-ec2.ami
}


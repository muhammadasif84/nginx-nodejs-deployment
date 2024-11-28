resource "aws_eip" "nodejs" {
  instance = aws_instance.aws-ec2.id

  domain = "vpc"
}


data "aws_ssm_parameter" "al2" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-kernel-default-hvm-x86_64-gp2"
}

resource "aws_instance" "app" {
  ami           = data.aws_ssm_parameter.al2.value
  instance_type = "t2.micro"

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "prod-app"
  }
}

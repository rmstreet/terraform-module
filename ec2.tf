data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RM-Ubutun-${var.hash_commit}"] # Nome da minha AMI privada
  }

  owners = ["526664489391"] # Meu Usuário
}

resource "aws_instance" "web" {
  count                  = var.instance_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.enable_sg ? aws_security_group.optional[*].id : [data.aws_security_group.default.id]

  tags = {
    Name = var.name
  }
}



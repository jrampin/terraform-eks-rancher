provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "rancher_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = aws_key_pair.terraform_key.id
  subnet_id     = var.public_subnet1_network.id
  vpc_security_group_ids = [var.security_group.id]

  connection {
    type     = "ssh"
    user     = "ubuntu"
    password = ""
    private_key = file("~/.ssh/id_rsa")
    host     = coalesce(self.public_ip, self.private_ip)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo curl https://releases.rancher.com/install-docker/19.03.sh | sh && sudo usermod -aG docker ubuntu"
    ]
  }

  tags = {
        Name = "dev-rancher"
        Environment = var.environment
        Description = "Managed by Terraform"
      }
}

resource "aws_instance" "k8s-1_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = aws_key_pair.terraform_key.id
  subnet_id     = var.public_subnet1_network.id
  vpc_security_group_ids = [var.security_group.id]

  connection {
    type     = "ssh"
    user     = "ubuntu"
    password = ""
    private_key = file("~/.ssh/id_rsa")
    host     = coalesce(self.public_ip, self.private_ip)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo curl https://releases.rancher.com/install-docker/19.03.sh | sh && sudo usermod -aG docker ubuntu"
    ]
  }

  tags = {
    Name = "dev-k8s-1"
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_instance" "k8s-2_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = aws_key_pair.terraform_key.id
  subnet_id     = var.public_subnet1_network.id
  vpc_security_group_ids = [var.security_group.id]

  connection {
    type     = "ssh"
    user     = "ubuntu"
    password = ""
    private_key = file("~/.ssh/id_rsa")
    host     = coalesce(self.public_ip, self.private_ip)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo curl https://releases.rancher.com/install-docker/19.03.sh | sh && sudo usermod -aG docker ubuntu"
    ]
  }

  tags = {
    Name = "dev-k8s-2"
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_instance" "k8s-3_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.medium"
  key_name      = aws_key_pair.terraform_key.id
  subnet_id     = var.public_subnet1_network.id
  vpc_security_group_ids = [var.security_group.id]

  connection {
    type     = "ssh"
    user     = "ubuntu"
    password = ""
    private_key = file("~/.ssh/id_rsa")
    host     = coalesce(self.public_ip, self.private_ip)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo curl https://releases.rancher.com/install-docker/19.03.sh | sh && sudo usermod -aG docker ubuntu"
    ]
  }

  tags = {
    Name = "dev-k8s-3"
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}
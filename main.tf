provider "aws" {
  region = var.region_name
}

resource "aws_instance" "fct" {
  ami = var.image
  instance_type = var.instance_type
  key_name = var.key_pair
  vpc_security_group_ids = var.sg
  subnet_id = var.subnet
  user_data = <<-EOF
                #!/bin/bash
                yum install httpd -y
                systemctl start httpd
                systemctl enable httpd
                echo "<h1> Hello word </h1>" > /var/www/html/index.html
            EOF
}
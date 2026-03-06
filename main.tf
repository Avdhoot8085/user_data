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
                yum install git -y
                git clone https://github.com/aryakonly/static-website.git
                mv static-website/* /var/www/html/
            EOF
    tags = {
      Name = "static-web"
    }
}

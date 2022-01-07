resource "aws_instance" "FOOTBALL" {
  ami             = "ami-0dc5785603ad4ff54"
  instance_type   = "t2.micro"
  key_name        = "anji-key"
  subnet_id       = "subnet-000619559d9f1f935"
  security_groups = [aws_security_group.apache-sg.id]
  user_data = <<EOF
  #!/bin/bash
yum update -y
yum install httpd -y 
systemctl enable httpd
systemctl start httpd
mkdir -p  /var/www/html/anji/
echo "this is anji" >/var/www/html/anji/index.html
EOF
  tags = {

    Name = "FOOTBALL"
  }
}
resource "aws_instance" "CRICKET" {
  ami             = "ami-0dc5785603ad4ff54"
  instance_type   = "t2.micro"
  key_name        = "anji-key"
  subnet_id       = "subnet-04db76bbd77f5e23d"
  security_groups = [aws_security_group.apache-sg.id]
  user_data = <<EOF
  
#!/bin/bash
yum update -y
yum install httpd -y 
systemctl enable httpd
systemctl start httpd
mkdir -p  /var/www/html/sai/
echo "this is sai" >/var/www/html/sai/index.html
EOF

  tags = {
    Name = "CRICKET"
  }
}
resource "aws_key_pair" "anji" {
  key_name   = "anji-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/k5Lg8jK6d5jCJCKJlp2ocltd7WB9HZb2Vyid2w19xQ06O5A7zXLAdkN+3Nu+hdH1fpVW29fTIVeO/bN4FyipbRCrCiAAmztHkRDSHFuVy39flXPnIJIlHC9zZtwgd5PaHy70fZ88RqEXl0Siksi0TG07NEFcpm0kxnMBNU5qr0xoR2UhmsSmqsDpPZuFnnHxrFe0xM6XG8FQ/eCnUfpRoC5ADqFvm+rpbXcVtM6gylSXwFdeqoyRZnUkfWGEbGAzK2wznOQqBaDPc2S1RsdAyzK9nGECfwTKebsg0i/ZU4S1/R03JCmX9Xxv5n96h/Vuh+It/lZCzaAfHE3JpUYeJUVFynyw+JfykyJD8Xce1XGxK2to0mZh8M5pU7uwhE5DeSmAr4jvY94+8gjEhIep/zmKsuQVaWhkLMlGYghV4iaodUj2tPLlnuxl/N/IltJ+dDkghF+MMi5a5hpF21kjZd7NkmGOjUuY9WO3ZfmxEujKpnPRue5XiG5SbeMEtfM= ANJU YADAV@LAPTOP-IFFFOLT4"
}
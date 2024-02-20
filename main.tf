locals {
  topic-name = "updates-topic"
}

#new sns topic
resource "aws_sns_topic" "user_updates" {
  name = "sufiyan-updates-topic-${var.abc}"
}

resource "aws_instance" "sufiyan_ec2_instance" {
  ami           = "ami-0e731c8a588258d0d"  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Set your desired instance type
  subnet_id     = "subnet-0d647d78d2309afc0"
  associate_public_ip_address =  true
  key_name      = "sufiyan-useast1-keypair"  # Replace with your key pair name

    tags = {
    Name = "sufiyan-ec2-instance"
  }
}

resource "aws_security_group" "sufiyan_security_group" {
  name        = "sufiyan-allow-http-https-ssh"
  description = "Allow HTTP, HTTPS, and SSH from my IP"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["218.212.61.10"]  # Replace with your actual IP address
  }
}
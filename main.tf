# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-bucket-arran"
    key    = "AKIAJ4AZ2ADQ35GBPS2Q"
    region = "eu-west-3"
  }
}

# Use AWS Terraform provider
provider "aws" {
  region = "eu-west-3"
}

# Create EC2 instance
resource "aws_instance" "default" {
  ami                    = "${var.ami}"
  count                  = "${var.notcount}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  source_dest_check      = false
  instance_type          = "${var.instance_type}"
  key_name_teams         = "${var.key_name_teams}"
  }

  tags = {
    Name = "terraform-default"
  }
}

# Create Security Group for EC2
resource "aws_security_group" "default" {
  name = "terraform-default-sg" 

  
  ingress {
    from_port   = 80
    to_port     = 82
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}



  

  

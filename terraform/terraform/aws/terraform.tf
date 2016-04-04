variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "eu-west-1"
}
variable "team" {
  default = "Team1"
}

# Step 1 - Create infrastructure - VPC
# More info about regions, see http://docs.aws.amazon.com/general/latest/gr/rande.html
module "vpc" {
  source = "./modules/vpc"

  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  team       = "${var.team}"
}

# Step 2 - Spin up an instance

# UNCOMMENT FOLLOWING LINE
/*
variable "owner"    {
  default = "Owner1"
}
# CentOS 7 AMI. See https://aws.amazon.com/marketplace/pp/B00O7WM7QW
variable "ami"      {
  default = "ami-7abd0209"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "webapp" {
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  subnet_id              = "${module.vpc.subnet_id}"
  vpc_security_group_ids = ["${module.vpc.security_group_id}"]
  key_name               = "terraform"
  tags {
    Name = "${concat(var.team, "-", var.owner, "-Instance")}"
  }

  provisioner "remote-exec" {
    inline = [
      "echo `whoami`",
    ]

    connection {
      host        = "${aws_instance.webapp.public_ip}"
      user        = "centos"
      private_key = "${file("terraform.pem")}"
      agent       = false
    }
  }
}
*/
# UNCOMMENT PREVIOUS LINE
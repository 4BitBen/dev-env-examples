provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

###################################################################
# AWS VPC
###################################################################
resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags {
    Name = "${concat(var.team, "-", var.tag_name)}"
  }
}

resource "aws_subnet" "dev" {
    vpc_id = "${aws_vpc.dev.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "${concat(var.region, "a")}"
    map_public_ip_on_launch = true

    tags {
        Name = "${concat(var.team, "-", var.tag_name)}"
    }
}

resource "aws_internet_gateway" "dev" {
    vpc_id = "${aws_vpc.dev.id}"

    tags {
        Name = "${concat(var.team, "-", var.tag_name)}"
    }
}

resource "aws_route_table" "dev" {
    vpc_id = "${aws_vpc.dev.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.dev.id}"
    }

    tags {
        Name = "${concat(var.team, "-", var.tag_name)}"
    }
}

resource "aws_main_route_table_association" "dev" {
    vpc_id = "${aws_vpc.dev.id}"
    route_table_id = "${aws_route_table.dev.id}"
}

###################################################################
# AWS Security Groups
###################################################################

resource "aws_security_group" "webapp" {
  name = "Webapp"
  description = "Web Application Security"
  vpc_id = "${aws_vpc.dev.id}"

  tags {
    Name = "${concat(var.team, "-", var.tag_name)}"
  }

  # SSH
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
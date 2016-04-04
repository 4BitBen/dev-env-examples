output "vpc_id" {
    value = "${aws_vpc.dev.id}"
}

output "subnet_id" {
    value = "${aws_subnet.dev.id}"
}

output "security_group_id" {
    value = "${aws_security_group.webapp.id}"
}

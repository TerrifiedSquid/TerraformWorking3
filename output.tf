output "instance_ips" {
  value = ["${aws_instance.terraformjenkins.*.public_ip}"]
}

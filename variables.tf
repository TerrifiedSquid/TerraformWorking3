variable "notcount" {
  default = 1
}

variable "JenkinsKey20191007" {
  description = "Private key name to use with instance"
  default     = "JenkinsKey20191007"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t3.small"
}

variable "ami" {
  description = "Base AMI to launch the instances"

  # Bitnami NGINX AMI
  default = "ami-0e9c8f3f51f2984e6"
}

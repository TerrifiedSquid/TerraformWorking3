variable "notcount" {
  default = 1
}

variable "key_name" {
  description = "Private key name to use with instance"
  default     = "TerraformJenkins20190930"
}

variable "GITHUB_TOKEN" {
  description = "Private key name to use with instance"
  default   = "GithubSecretNew1"

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

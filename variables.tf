variable "notcount" {
  default = 1
}

variable "key_name" {
  description = "AWS key"
  default     = "TerraformJenkins20190930"
}



  variable "github_organization" {
  description = "Organization Name"
  default     = "TerrifiedSquid"
}

# The following variable is meant to point back to  
variable "TOKEN" {
  description = "Token for Access"
   default     = "vault-github-access-token"
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

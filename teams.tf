 provider "github" {
 organization = "${var.github_organization}"
 github_token        = "${var.TOKEN}"  
  } 

resource "github_membership" "ArranTest" {
username = "ArranTest"
role = "member" 
}





 provider "github" {
 organization = "${var.github_organization}"
 GITHUB_TOKEN        = "${var.TOKEN}"  
  } 

resource "github_membership" "ArranTest" {
username = "ArranTest"
role = "member" 
}





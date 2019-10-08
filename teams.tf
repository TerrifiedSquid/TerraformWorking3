provider "github" {
 organization = "${var.github_organization}"
 token        = "${var.github_token}"  
  } 

resource "github_membership" "ArranTest" {
username = "ArranTest"
role = "member" 
}


# Adding member to team



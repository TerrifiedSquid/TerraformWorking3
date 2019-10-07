provider "github" {
 organization = "${var.github_organization}"
 token        = "${var.github_token}"  
  } 


# Adding member to team


resource "github_membership" "ArranTest" {
  username = "ArranTest"
  role     = "member"
}

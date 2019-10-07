provider "github" {
 organization = "${var.github_organization}"
 token        = "${var.github_token}"  
  } 


# Adding member to team

resource "github_team" "squid1" {
  name        = "squid1"
  description = "way down on the ocean floor"
  privacy     = "closed"
}

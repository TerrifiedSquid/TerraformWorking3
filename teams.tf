provider "github" {
 organization = "${var.github_organization}"
 token        = "${var.github_token}"  
  } 


# Adding member to team
resource "github_team_membership" "StarFish" {
  team_id  = "${3456269}"
  username = "ArranHL"
  role     = "member"
}    


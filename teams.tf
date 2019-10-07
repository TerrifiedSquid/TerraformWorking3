provider "github" {
 organization = "${var.github_organization}"

  } 


# Adding member to team
resource "github_team_membership" "StarFish" {
  team_id  = "${3456269}"
  username = "ArranHL"
  role     = "member"
}    


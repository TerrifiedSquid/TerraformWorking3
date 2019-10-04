 # Adding a Memeber to an Org and Team
provider "github" {
organization = "CrackingKraken"
  
resource "github_membership" "membership_for_some_user" {
  username = "ArranTest"
  role     = "member"
}
resource "github_team" "some_team" {
  name        = "bteam"
  description = "Not A team… But Not C team either"
  }
resource "github_team_membership" "bteam_membership" {
  team_id  = "${3419528}"
  username = "ArranTest"
  role     = "member"
}
  }

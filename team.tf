 # Adding a Memeber to an Org and Team
provider "github" {
organization = "CrackingKraken"
  
resource "github_membership" "ArranTest" {
  username = "ArranTest"
  role     = "member"
}

resource "github_team_membership" "bteam_membership" {
  team_id  = "${3419528}"
  username = "ArranTest"
  role     = "member"
}
  }

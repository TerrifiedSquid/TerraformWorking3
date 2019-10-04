# Adding member to team

  provider "github" {
organization = "CrackingKraken"
    }
resource "github_membership" "membership_ArranTest" {
  username = "ArranTest"
  role     = "member"
}
resource "github_team" "bteam" {
  name        = "SomeTeam"
  description = "Some cool team"
}
resource "github_team_membership" "bteam_membership" {
  team_id  = "${3419528}"
  username = "ArranTest"
  role     = "member"
}
    

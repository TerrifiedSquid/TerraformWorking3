provider "github" {
organization = "CrackingKraken"
}

# Adding member to team
resource "teams_key" "key" {
  key_name   = "${var.key_name_teams}"
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
    

provider "github" {
organization = "CrackingKraken"
  
}

resource "teams_key_teams" "default1" {	
  key_name_teams   = "${var.key_name_teams}"	
  }
# Adding member to team

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
    

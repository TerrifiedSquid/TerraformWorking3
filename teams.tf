provider "github" {
organization = "TerrifiedSquid"
 token        = "${var.github_token}"  



# Adding member to team

resource "github_team" "some_team" {
  name        = "squid1"
  description = "way down on the ocean floor"
  privacy     = "closed"
}
  }  

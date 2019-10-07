provider "github" {
organization = "TerrifiedSquid"
 token        = "${var.GITHUB_TOKEN}"  
  } 


# Adding member to team

resource "github_team" "squid1" {
  name        = "squid1"
  description = "way down on the ocean floor"
  privacy     = "closed"
}

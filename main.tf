locals {
  raw_input = yamldecode(file("repositories.yaml"))
  repositories = {
    for _name, _repo in local.raw_input : _name => merge(_repo, {
      enable_issues           = true
      enable_discussions      = true
      allow_bypass_protection = true
      team_permission = {
        "techchapter" = "read_write",
      }
    })
  }
}

module "github" {
  source = "github.com/pippiio/github-organization?ref=feat/git-runners"

  organization = merge({ members = {} }, var.organization)
  teams        = var.teams
  repositories = local.repositories

  hosted_runners = {
    groups = {
      "grp1" = {
        repositories = ["github-organization"]
      }
      "grp2" = {}
    }
  }

}

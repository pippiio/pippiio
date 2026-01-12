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
  source = "github.com/pippiio/github-organization?ref=v3.0.1"

  organization = merge({ members = {} }, var.organization)
  teams        = var.teams
  repositories = local.repositories
}

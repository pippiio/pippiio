locals {
  repositories = {
    for repo_name, repo in var.repositories : repo_name => merge(repo, {
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
  source = "github.com/pippiio/github-organization?ref=v2.2.1"

  organization = merge({ members = {} }, var.organization)
  teams        = var.teams
  repositories = local.repositories
}

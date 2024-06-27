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
  source = "git::https://github.com/pippiio/github-organization?ref=feat/org-tag-ruleset"

  organization = merge({ members = {} }, var.organization)
  teams        = var.teams
  repositories = local.repositories
}

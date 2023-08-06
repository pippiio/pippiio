locals {
  repositories = {
    for repo_name, repo in var.repositories : repo_name => merge(repo, {
      enable_issues      = true
      enable_discussions = true
      team_permission = {
        "techchapter" = true,
      }
    })
  }
}

module "github" {
  source = "github.com/pippiio/github-organization?ref=v1.4.0"

  organization = merge({ members = {} }, var.organization)
  teams        = var.teams
  repositories = local.repositories
  environments = var.environments
}

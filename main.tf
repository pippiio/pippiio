locals {
  repositories = {
    for repo_name, repo in var.repositories : repo_name => merge(repo, { team_permission = { "techchapter" = true, "maintaner" = true } })
  }
}

module "github" {
  source = "github.com/pippiio/github-organization?ref=v1.4.0"

  organization = merge({ members = {} }, var.organization)
  teams        = var.teams
  repositories = local.repositories
  environments = var.environments
}

module "github" {
  source = "/Users/jr/git/pippi.io/github-organization"
  # source = "github.com/pippiio/github-organization?ref=v1.0.0"

  organization = merge({ members = {} }, var.organization)
  teams        = {} //var.teams
  repositories = var.repositories
  environments = var.environments
}

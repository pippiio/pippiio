module "github" {
  source = "github.com/pippiio/github-organization?ref=v1.2.0"

  organization = merge({ members = {} }, var.organization)
  teams        = {}
  repositories = var.repositories
  environments = var.environments
}

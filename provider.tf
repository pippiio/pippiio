provider "github" {
  owner = var.organization.name

  app_auth {
    id              = local.github_config.app_auth.id
    installation_id = local.github_config.app_auth.installation_id
    pem_file        = base64decode(var.github_pem_file)
  }
}

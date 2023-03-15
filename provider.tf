provider "github" {
  owner = var.organization.name

  app_auth {
    id              = var.app_auth.id
    installation_id = var.app_auth.installation_id
    pem_file        = var.app_auth_private_key
  }
}

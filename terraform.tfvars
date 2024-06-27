app_auth = {
  id              = "305781"
  installation_id = "35281913"
}

organization = {
  billing_email   = "hello@pippi.io"
  public_email    = "pippi@techchapter.com"
  name            = "pippiio"
  display_name    = "Pippi io"
  description     = "Battle tested Terraform modules"
  location        = "Denmark"
  website         = "https://pippi.io"
  twitter         = null
  enable_scanning = true
  members         = {}
}

teams = {
  "techchapter" = {
    description        = "Maintainers of pippiio organization from TechChapter"
    members            = {}
    bypass_version_tag = true
  }
}

terraform {
  required_version = "~>1.8"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~>6"
    }

    tfe = {
      version = "~>0.53"
    }
  }
}

terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "pippiio"
    workspaces {
      name = "pippiio"
    }
  }
}

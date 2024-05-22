variable "organization" {
  type = object({
    billing_email   = string
    name            = string
    display_name    = string
    description     = string
    public_email    = string
    location        = string
    website         = string
    enable_scanning = optional(bool, false)
    members         = map(string)
  })
  description = <<-EOL
    GitHub organization configuration:

    billing_email   : The billing email address for the organization
    name            : The GitHub name for the organization
    display_name    : Organization display name
    description     : An organization description
    public_email    : Organization e-mail (will be public)
    location        : The organization location or country
    website         : The companyu website
    enable_scanning : Enable GitHub managed code security scanning
    members         : A list of GitHub usernames to join organization as memebers
  EOL
}

variable "teams" {
  type = map(object({
    description        = string
    code_review_count  = optional(number, 1)
    code_review_notify = optional(bool, true)
    members            = map(string)
  }))
  description = <<-EOL
    A map of GitHub team configuration to be added to the organization:

    Key   : Name of team
    Value :
      description        : Team description
      code_review_count  : The number of team members to assign to a pull request
      code_review_notify : Whether to notify the entire team when at least one member is also assigned to the pull request
      members            : A map of members to join the team
        Key   : member's GitHub username
        Value : member role in team
  EOL
}

variable "repositories" {
  type = map(object({
    description                = string
    visibility                 = optional(string, "public")
    homepage                   = optional(string)
    enable_projects            = optional(bool, false)
    enable_wiki                = optional(bool, false)
    enable_issues              = optional(bool, false)
    allow_merge_commit         = optional(bool, false)
    allow_squash_merge         = optional(bool, true)
    allow_rebase_merge         = optional(bool, false)
    delete_branch_on_merge     = optional(bool, true)
    required_approvals         = optional(number, 1)
    require_code_owner_reviews = optional(bool, false)
    required_status_checks     = optional(set(string), [])
    team_permission            = optional(map(bool), {})
    collaborator_permission    = optional(map(bool), {})
    template                   = optional(string)
    is_template                = optional(bool, false)
    topics                     = optional(list(string), [])
    environments = optional(map(map(object({
      description = string
      value       = string
      sensitive   = bool
    }))), {})
  }))
  description = <<-EOL
    A map of GitHub repositories in the organization.

    Key   : The name of the repository
    Value :
      description                : A description of the repository
      visibility                 : Can be `public` or `private`. Defaults to private
      homepage                   : URL of a page describing the project
      enable_projects            : Set to true to enable the GitHub Projects features on the repository
      enable_wiki                : Set to true to enable the GitHub Wiki features on the repository
      enable_issues              : Set to true to enable the GitHub Issues features on the repository
      allow_merge_commit         : Set to true to enable merge commits on the repository
      allow_squash_merge         : Set to false to disable squash merges on the repository
      allow_rebase_merge         : Set to true to enable rebase merges on the repository
      delete_branch_on_merge     : Set to false to disable automatically deletion of head branch after a pull request is merged
      required_approvals         : Required number of approvals to satisfy main branch protection requirements
      require_code_owner_reviews : Require an approved review in pull requests including files with a designated code owner
      required_status_checks     : The list of status checks to require in order to merge into main branch
      team_permission            : A map of GitHub organization teams to grant access
        Key   : The name of GitHub them team
        Value : Set to true to grant write access and false to grant read-only access
      collaborator_permission    : A map of GitHub collaborators to grant access
        Key   : The collaborator's GitHub username
        Value : Set to true to grant write access and false to grant read-only access
      environments               : A set of references to shared secrets to add to configure for the repo
      template                   : The name of the template repository. This must be loctaed within the same organization.
      is_template                : Wether the repository is enabled as template repository.
      topics                     : The list of topics of the repository.
  EOL
}

variable "environments" {
  type = map(object({
    organization_scope = optional(bool, false)
    name               = optional(string)
    variables = map(object({
      value     = string
      sensitive = optional(bool, false)
    }))
  }))
  default     = {}
  description = <<-EOL
    A map of organization variable sets:

    Key   : Name of the variable set
    Value : 
      organization_scope : Wether to shared with all repositories in organization
      variables          : A map op variables in the set
        Key   : The variable key
        Value :
          value     : The variable value
          sensitive : Wether the variable should be marked as sensitive
  EOL
}

variable "app_auth" {
  type = object({
    id              = string
    installation_id = string
  })
  description = "https://github.com/organizations/pippiio/settings/apps/"
}

variable "app_auth_private_key" {
  type        = string
  sensitive   = true
  description = "https://github.com/organizations/pippiio/settings/apps/"
}

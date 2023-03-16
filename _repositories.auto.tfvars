repositories = {
  "pippiio" = { description = "Terraform configuration for pippiio" }
  "template" = {
    description = "Template repository for pippiio modules"
    is_template = true
  }

  "aws-cicd"             = { description = "Terraform module for deploying AWS CICD resources" }
  "aws-cognito-userpool" = { description = "Terraform module for deploying AWS Cognito Userpool resources" }
  "aws-dns"              = { description = "Terraform module for deploying AWS Route53 resources" }
  "aws-ec2"              = { description = "Terraform module for EC2 autoscalling" }
  "aws-ecr"              = { description = "Terraform module for deploying AWS ECR resources" }
  "aws-eks"              = { description = "Terraform module for deploying AWS EKS (Kubernetes) resources" }
  "aws-organization"     = { description = "Terraform module for deploying AWS Organization resources" }
  "aws-rds"              = { description = "Terraform module for deploying AWS RDS resources" }
  "aws-serverless"       = { description = "Terraform module for deploying AWS Serverless resources" }
  "aws-static-website"   = { description = "A static-website based on S3 with CloudFront CDN" }
  "aws-vpc"              = { description = "Terraform module for deploying AWS VPC resources" }

  "github-organization"  = { description = "Terraform module for managing a GitHub organization" }
  "tfcloud-organization" = { description = "Terraform module for managing a Terraform Cloud Organization" }
}

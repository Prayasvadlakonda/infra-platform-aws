module "vpc" {
  source = "../../modules/vpc"
}

module "app" {
  source      = "../../modules/app"
  environment = "prod"
  image       = "ghcr.io/prayasvadlakonda/platform-cicd-system:v1.0.0"
}
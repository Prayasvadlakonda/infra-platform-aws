module "vpc" {
  source      = "../../modules/vpc"
  environment = "dev"
}

module "app" {
  source      = "../../modules/app"
  environment = "dev"
  image       = "ghcr.io/prayasvadlakonda/platform-cicd-system:latest"

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids

  desired_count = 1
  cpu           = "256"
  memory        = "512"
}

output "app_url" {
  description = "URL of the dev application"
  value       = "http://${module.app.alb_dns_name}"
}

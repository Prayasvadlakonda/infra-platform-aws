module "vpc" {
  source      = "../../modules/vpc"
  environment = "prod"
}

module "app" {
  source      = "../../modules/app"
  environment = "prod"
  image       = "ghcr.io/prayasvadlakonda/platform-cicd-system:v1.0.0"

  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids

  desired_count = 2
  cpu           = "512"
  memory        = "1024"
}

output "app_url" {
  description = "URL of the prod application"
  value       = "http://${module.app.alb_dns_name}"
}

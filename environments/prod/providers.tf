terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment and configure to use remote state (strongly recommended for prod):
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "platform/prod/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "infra-platform"
      ManagedBy   = "terraform"
      Environment = "prod"
    }
  }
}

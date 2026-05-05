# infra-platform-aws

Terraform infrastructure for deploying a containerized application on AWS ECS Fargate, behind an Application Load Balancer, inside a private VPC.

## Architecture

```
Internet → ALB (public subnets) → ECS Fargate tasks (private subnets) → NAT Gateway → Internet
```

Each environment gets its own VPC, ALB, ECS cluster, and CloudWatch log group.

## Structure

```
modules/
  vpc/      — VPC, public/private subnets, IGW, NAT, route tables
  app/      — ECS cluster, task definition, service, ALB, security groups, IAM, CloudWatch

environments/
  dev/      — dev deployment (1 task, :latest image)
  prod/     — prod deployment (2 tasks, pinned semver image)
```

## Usage

```bash
cd environments/dev   # or environments/prod
terraform init
terraform plan
terraform apply
```

After apply, the `app_url` output gives the ALB address.

## Remote State (recommended)

Uncomment the `backend "s3"` block in each environment's `providers.tf` and supply:
- An S3 bucket for state storage
- A DynamoDB table for state locking (`terraform-locks`)

## Requirements

- Terraform >= 1.5
- AWS provider ~> 5.0
- AWS credentials configured (`aws configure` or environment variables)

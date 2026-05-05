variable "environment" {
  description = "Environment name"
  type        = string
}

variable "image" {
  description = "Docker image to deploy (e.g. ghcr.io/org/repo:tag)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to deploy into"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of public subnets for the ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs of private subnets for ECS tasks"
  type        = list(string)
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "CPU units for the Fargate task (256, 512, 1024, 2048, 4096)"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory (MB) for the Fargate task"
  type        = string
  default     = "512"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 8000
}

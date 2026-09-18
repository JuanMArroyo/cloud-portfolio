variable "project" {
  type        = string
  description = "Project name prefix for resource tags"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for NAT Gateway"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID for NAT Gateway"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for route table associations"
}


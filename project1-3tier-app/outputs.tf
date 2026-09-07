output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.subnets.public_subnet_ids
}

output "private_app_subnet_ids" {
  description = "List of private application subnet IDs"
  value       = module.subnets.private_app_a_id
}

output "private_db_subnet_ids" {
  description = "List of private database subnet IDs"
  value       = module.subnets.private_db_subnet_ids
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "ec2_instance_id" {
  description = "EC2 instance ID for the application tier"
  value       = module.ec2.instance_id
}

output "db_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.db_endpoint
}

output "s3_logs_bucket" {
  description = "S3 bucket used for ALB access logs"
  value       = module.s3_logs.bucket_name
}


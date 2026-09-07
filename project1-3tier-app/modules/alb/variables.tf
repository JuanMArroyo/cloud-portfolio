variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  description = "security group ID for the Application Load Balancer"
  type = string
}

variable "log_bucket_name" {
  type = string
}

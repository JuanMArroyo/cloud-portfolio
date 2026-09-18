terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.64.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

module "lambda" {
  source        = "./modules/lambda"
  function_name = "serverless-api"
  handler       = "handler.lambda_handler"
  filename      = "lambda_src/lambda.zip"
  role_arn      = aws_iam_role.lambda_exec.arn
}

module "api_gateway" {
  source            = "./modules/apigateway"
  api_name          = "serverless-api"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
}
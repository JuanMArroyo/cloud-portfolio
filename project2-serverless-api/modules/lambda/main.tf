resource "aws_lambda_function" "this" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = "python3.12"

  filename = var.filename
  source_code_hash = filebase64sha256(var.filename)

  role = var.role_arn
}
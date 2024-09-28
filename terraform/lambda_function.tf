resource "aws_lambda_function" "this" {
  filename      = "lambda_function__payload.zip"
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = var.role
}
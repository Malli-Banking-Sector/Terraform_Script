





module "s3_bucket" {
  source = file ("./modules/s3_bucket")
  
  bucket_name = "my-terraform-bucket"
}

# Module for creating API Gateway
module "api_gateway" {
  source = file ("./modules/api_gateway")

  rest_api_name = "My-Terraform-API"
  api_gateway_stage_name = "prod"  
}

# Module for creating a Lambda function
module "lambda_function" {
  source = file  ("./modules/lambda_function") 

  function_name = "my-terraform-lambda"
  handler = "index.handler"
  runtime = "nodejs14.x"
  role = module.lambda_role.arn
}

# Module for creating an IAM role for lambda function
module "lambda_role" {
  source = file ("./modules/lambda_role")

  role_name = "my-terraform_lambda_role"
}
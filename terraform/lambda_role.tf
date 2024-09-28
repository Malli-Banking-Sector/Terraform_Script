resource "aws_iam_role" "this" {
  name        = var.role_name
  description = "My Terraform Lamda Role"

  assume_role_policy = <<EOF
{
"version": "2012-10-17",
 "statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
        "Service": "lambda.amazoneaws.com"
      },
      "Effect" : "Allow",
      "Sid": ""
    }
  ]
}
EOF  
}

resource "aws_iam_policy" "this" {
  name        = var.role_name
  description = "My Terraform Lambda Policy"

  policy      = <<EOF
{
  "version": "2012-10-17",
    "statement": [
   {
     "Action": "logs:*",
     "Resources": "arn:aws:logs:*:*:*",
     "Effect" : "Allow",
    }
  ]
}
EOF  
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

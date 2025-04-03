terraform {
  backend "s3" {
    bucket         = "t2s-aws-dev-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "t2s-aws-dev-locks"
    encrypt        = true
  }
}
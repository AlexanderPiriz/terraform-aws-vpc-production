terraform {
  backend "s3" {
    bucket         = "alexander-terraform-state"
    key            = "vpc/dev/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

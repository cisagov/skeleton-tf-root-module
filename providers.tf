provider "aws" {
  # Our primary provider uses our terraform role
  assume_role {
    role_arn     = var.tf_role_arn
    session_name = "terraform-example"
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

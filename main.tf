#-------------------------------------------------------------------------------
# Configure the example module.
#-------------------------------------------------------------------------------
module "example" {
  providers = {
    aws = aws
  }
  source = "github.com/cisagov/skeleton-tf-module"

  ami_owner_account_id  = var.ami_owner_account_id
  aws_availability_zone = var.aws_availability_zone
  aws_region            = var.aws_region
  subnet_id             = aws_subnet.example.id
}

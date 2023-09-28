provider "volterra" {
  api_url       = var.f5xc_api_url
  api_cert      = var.f5xc_api_cert
  api_key       = var.f5xc_api_key
  alias         = "default"
}

provider "aws" {
  region = var.f5xc_aws_region
  access_key = var.f5xc_aws_region
  secret_key = var.f5xc_aws_region
  alias  = "default"
}
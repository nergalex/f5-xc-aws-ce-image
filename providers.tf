#provider "volterra" {
#  url           = var.f5xc_api_url
#  api_cert      = var.f5xc_api_cert
#  api_key       = var.f5xc_api_key
#  alias         = "default"
#}

provider "aws" {
  region      = var.f5xc_aws_region
  access_key  = var.aws_access_key_id
  secret_key  = var.aws_secret_access_key
  alias       = "default"
}
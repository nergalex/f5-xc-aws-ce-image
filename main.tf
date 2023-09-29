provider "volterra" {
  url           = var.f5xc_api_url
  api_cert      = var.f5xc_api_cert
  api_key       = var.f5xc_api_key
  api_p12_file  = "gg"
  alias         = "default"
}

#provider "aws" {
#  region      = var.f5xc_aws_region
#  access_key  = var.aws_access_key_id
#  secret_key  = var.aws_secret_access_key
#  alias       = "default"
#}

#module "vpc__multi_node_single_nic_existing_vpc_existing_subnet" {
#  source             = "./modules/aws/vpc"
#  aws_owner          = var.owner
#  aws_region         = var.f5xc_aws_region
#  aws_az_name        = local.aws_availability_zone
#  aws_vpc_name       = var.aws_vpc_name
#  aws_vpc_cidr_block = var.aws_vpc_cidr_block
#  custom_tags        = local.custom_tags
#  providers          = {
#    aws = aws.default
#  }
#}
#
#module "f5xc_aws_secure_ce_single_node_single_nic_existing_vpc" {
#  source                = "./modules/f5xc/ce/aws"
#  owner_tag             = var.owner
#  is_sensitive          = false
#  has_public_ip         = false
#  create_new_aws_vpc    = false
#  f5xc_tenant           = var.f5xc_tenant
#  f5xc_api_url          = var.f5xc_api_url
#  f5xc_api_token        = var.f5xc_api_token
#  f5xc_namespace        = var.f5xc_namespace
#  f5xc_token_name       = format("%s-secure-cloud-ce-test-%s", var.project_prefix, var.project_suffix)
#  f5xc_aws_region       = var.f5xc_aws_region
#  f5xc_cluster_name     = format("%s-aws-ce-test-%s", var.project_prefix, var.project_suffix)
#  f5xc_cluster_labels   = { "ves.io/fleet" : format("%s-aws-ce-test-%s", var.project_prefix, var.project_suffix) }
#  f5xc_ce_gateway_type  = "ingress_gateway"
#  f5xc_aws_vpc_az_nodes = {
#    node0 = {
#      f5xc_aws_vpc_slo_subnet    = var.f5xc_aws_vpc_slo_subnet,
#      f5xc_aws_vpc_az_name       = format("%s%s", var.f5xc_aws_region, "a")
#    }
#  }
#  f5xc_cluster_latitude                = var.f5xc_cluster_latitude
#  f5xc_cluster_longitude               = var.f5xc_cluster_longitude
#  f5xc_is_secure_cloud_ce              = false # Custom Alexis
#  aws_existing_vpc_id                  = module.vpc__multi_node_single_nic_existing_vpc_existing_subnet.aws_vpc["id"]
#  aws_security_group_rules_slo_egress  = []
#  aws_security_group_rules_slo_ingress = []
#  ssh_public_key = file(var.ssh_public_key_file)
#  providers      = {
#    aws      = aws.default
#    volterra = volterra.default
#  }
#}

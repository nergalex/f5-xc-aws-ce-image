module "vpc__multi_node_single_nic_existing_vpc_existing_subnet" {
  source             = "./modules/aws/vpc"
  aws_owner          = "al.dacosta@f5.com"
  aws_region         = "eu-west-3"
  aws_vpc_name       = "vpc-alexis-ce-1nic"
  aws_vpc_cidr_block = "10.0.0.0/16"
  aws_az_name        = local.aws_availability_zone
  custom_tags        = local.custom_tags
  providers          = {
    aws = aws.default
  }
}

module "f5xc_aws_secure_ce_single_node_single_nic_existing_vpc" {
  source                = "./modules/f5xc/ce/aws"
  owner_tag             = "al.dacosta@f5.com"
  f5xc_is_secure_cloud_ce = true
  is_sensitive          = false
  has_public_ip         = false
  create_new_aws_vpc    = false
  f5xc_tenant           = var.f5xc_tenant
  f5xc_api_url          = var.f5xc_api_url
  f5xc_api_token        = var.f5xc_api_token
  f5xc_namespace        = var.f5xc_namespace
  f5xc_token_name       = format("%s-aws-ce-test-%s", var.project_prefix, var.project_suffix)
  f5xc_cluster_name     = format("%s-aws-ce-test-%s", var.project_prefix, var.project_suffix)
  f5xc_cluster_labels   = { "ves.io/fleet" : format("%s-aws-ce-test-%s", var.project_prefix, var.project_suffix) }
  f5xc_aws_region       = "eu-west-3"
  f5xc_aws_vpc_az_nodes = {
    node0 = {
      f5xc_aws_vpc_slo_subnet    = "10.0.128.0/20",
      f5xc_aws_vpc_az_name       = format("%s%s", var.f5xc_aws_region, "a")
    }
  }
  f5xc_cluster_latitude       = "48.866667"
  f5xc_cluster_longitude      = "2.333333"
  aws_existing_vpc_id  = module.vpc__multi_node_single_nic_existing_vpc_existing_subnet.aws_vpc["id"]
  aws_security_group_rules_slo_egress = []
  aws_security_group_rules_slo_ingress = []
  f5xc_ce_gateway_type   = "ingress_gateway"
  ssh_public_key         = file(var.ssh_public_key_file)
  providers              = {
    aws      = aws.default
    volterra = volterra.default
  }
}

#module "f5xc_aws_secure_ce_single_node_single_nic_existing_vpc" {
#  source                = "./modules/f5xc/ce/aws"
#  owner_tag             = "al.dacosta@f5.com"
#  is_sensitive          = false
#  has_public_ip         = false
#  create_new_aws_vpc    = false
#  f5xc_is_secure_cloud_ce = false  # Custom Alexis
#  f5xc_tenant           = var.f5xc_tenant
#  f5xc_api_url          = var.f5xc_api_url
#  f5xc_api_token        = var.f5xc_api_token
#  f5xc_namespace        = var.f5xc_namespace
#  f5xc_token_name       = format("%s-secure-cloud-ce-test-%s", var.project_prefix, var.project_suffix)
#  f5xc_cluster_name     = format("%s-aws-ce-test-%s", var.project_prefix, var.project_suffix)
#  f5xc_cluster_labels   = { "ves.io/fleet" : format("%s-aws-ce-test-%s", var.project_prefix, var.project_suffix) }
#  f5xc_aws_vpc_az_nodes = {
#    node0 = {
#      f5xc_aws_vpc_slo_subnet    = "10.0.128.0/20",
#      f5xc_aws_vpc_az_name       = format("%s%s", var.f5xc_aws_region, "a")
#    }
#  }
#  f5xc_ce_gateway_type        = "ingress_gateway"
#  f5xc_cluster_latitude       = "48.866667"
#  f5xc_cluster_longitude      = "2.333333"
#  f5xc_aws_region             = "eu-west-3"
#  aws_existing_vpc_id                  = module.vpc__multi_node_single_nic_existing_vpc_existing_subnet.aws_vpc["id"]
#  aws_security_group_rules_slo_egress  = []
#  aws_security_group_rules_slo_ingress = []
#  ssh_public_key = file(var.ssh_public_key_file)
#  providers      = {
#    aws      = aws.default
#    volterra = volterra.default
#  }
#}
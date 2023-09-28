variable "project_prefix" {
  type        = string
  description = "prefix string put in front of string"
  default     = "f5xc"
}

variable "project_suffix" {
  type        = string
  description = "prefix string put at the end of string"
  default     = "01"
}

variable "f5xc_api_cert" {
  type = string
  default = ""
}

variable "aws_access_key_id" {
  type = string
  default = ""
}

variable "aws_secret_access_key" {
  type = string
  default = ""
}

variable "f5xc_api_key" {
  type = string
  default = ""
}

variable "f5xc_api_url" {
  type = string
}

variable "f5xc_api_token" {
  type = string
}

variable "f5xc_tenant" {
  type = string
}

variable "f5xc_namespace" {
  type    = string
  default = "system"
}

variable "f5xc_aws_cred" {
  type    = string
  default = "ck-aws-01"
}

variable "f5xc_aws_region" {
  type    = string
  default = "us-west-2"
}

variable "f5xc_aws_availability_zone" {
  type    = string
  default = "a"
}

variable "owner" {
  type    = string
  default = "c.klewar@f5.com"
}

variable "ssh_public_key_file" {
  type = string
}

locals {
  aws_availability_zone = format("%s%s", var.f5xc_aws_region, var.f5xc_aws_availability_zone)
  custom_tags           = {
    Owner        = var.owner
    f5xc-tenant  = var.f5xc_tenant
    f5xc-feature = "${var.project_prefix}-aws-vpc-site"
  }
}

variable "aws_vpc_cidr_block" {
  description = "Custom CE VPC CIDR"
  type = string
}


variable "f5xc_aws_vpc_slo_subnet" {
  description = "Custom CE SLO subnet"
  type = string
}


variable "f5xc_ce_gateway_type" {
  description = "Custom CE gateway type"
  type = string
}


variable "f5xc_cluster_latitude" {
  description = "Custom CE geo location latitude"
  type = string
}


variable "f5xc_cluster_longitude" {
  description = "Custom CE geo location latitude"
  type = string
}


variable "aws_vpc_name" {
  description = "Custom CE existing AWS VPC name"
  type = string
}

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
  type = string
}

variable "f5xc_nfv_name" {
  type = string
}

variable "f5xc_nfv_domain_suffix" {
  type = string
}

variable "f5xc_nfv_node_name" {
  type = string
}

variable "is_sensitive" {
  type        = bool
  default     = false
  description = "Whether to mask sensitive data in output or not"
}
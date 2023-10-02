locals {
  gateway_type       = replace(var.f5xc_ce_gateway_type, "_", "-")
#  hosts_context_node = templatefile("${path.module}/${var.templates_dir}/hosts",
  hosts_context_node = templatefile("/home/runner/work/f5-xc-aws-ce-image/f5-xc-aws-ce-image/modules/f5xc/ce/aws/config/templates/hosts",
    {
      public_address = "127.0.1.1"
      public_name    = var.f5xc_ce_hosts_public_name
    }
  )

#  hosts_context_pool = templatefile("${path.module}/${var.templates_dir}/hosts",
  hosts_context_pool = templatefile("/home/runner/work/f5-xc-aws-ce-image/f5-xc-aws-ce-image/modules/f5xc/ce/aws/config/templates/hosts",
    {
      public_address = var.f5xc_ce_hosts_public_address
      public_name    = var.f5xc_ce_hosts_public_name
    }
  )

  vpm_config = yamlencode({
    "Vpm" : {
      "ClusterName" : var.f5xc_cluster_name,
      "ClusterType" : var.f5xc_cluster_type,
      "Token" : var.f5xc_site_token,
      # "InsideNIC" : ""
      # "PrivateNIC" : ""
      "Latitude" : var.f5xc_cluster_latitude,
      "Longitude" : var.f5xc_cluster_longitude,
      "MauricePrivateEndpoint" : var.maurice_mtls_endpoint,
      "MauriceEndpoint" : var.maurice_endpoint,
      "Labels" : var.f5xc_cluster_labels,
      "CertifiedHardwareEndpoint" : var.f5xc_certified_hardware_endpoint,
    }
    Kubernetes : {
      "EtcdUseTLS" : true
      "Server" : var.f5xc_ce_hosts_public_name
    }
  })

  cloud_config = templatefile("/home/runner/work/f5-xc-aws-ce-image/f5-xc-aws-ce-image/modules/f5xc/ce/aws/config/templates/cloud-init.yml",
    {
      ssh_public_key    = var.ssh_public_key
      ntp_servers       = var.ntp_servers
      hosts_context     = base64encode(local.hosts_context_node)
      reboot_strategy   = var.reboot_strategy_node
      vp_manager_config = base64encode(local.vpm_config)
    })
}
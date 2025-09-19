terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.3.1"
    }
  }
  required_version = ">= 1.0.0"
  
  # Uncomment this block if you want to use a remote backend
  # backend "s3" {
  #   bucket         = "terraform-state-bucket"
  #   key            = "vsphere/dev/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-locks"
  # }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

# Define VM configurations for this environment
locals {
  vms = {
    "vm1" = {
      datacenter = "NCH-01",
      datastore  = "datastore1",
      network    = "Local-Network",
      ip         = "192.168.0.4",
      cpu        = 4,
      memory     = 8192,
      disk_size  = 100,
      tags       = { environment = "dev", role = "LDAP_01" }
    },
    "vm2" = {
      datacenter = "NCH-01",
      datastore  = "datastore1",
      network    = "Local-Network",
      ip         = "192.168.0.5",
      cpu        = 4,
      memory     = 8192,
      disk_size  = 100,
      tags       = { environment = "dev", role = "LDAP_02" }
    },
    "vm3" = {
      datacenter = "NCH-01",
      datastore  = "datastore1",
      network    = "Local-Network",
      ip         = "192.168.0.6",
      cpu        = 4,
      memory     = 8192,
      disk_size  = 100,
      tags       = { environment = "dev", role = "GitLab-EE" }
    }
  }
}

# Create VMs using the module
module "vms" {
  source   = "../../modules/vsphere-vm"
  for_each = local.vms

  vsphere_datacenter = each.value.datacenter
  vsphere_datastore  = each.value.datastore
  vsphere_cluster    = each.value.cluster
  vsphere_network    = each.value.network
  
  template_name = var.template_name
  vm_name       = "${var.vm_name_prefix}-${each.key}"
  vm_cpu        = each.value.cpu
  vm_memory     = each.value.memory
  vm_disk_size  = each.value.disk_size
  vm_domain     = var.vm_domain
  
  vm_ip         = each.value.ip
  vm_gateway    = var.vm_gateway
  vm_dns_servers = var.vm_dns_servers
  
  tags          = each.value.tags
}
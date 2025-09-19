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
    "LDAP_01" = {
      datacenter = "NCH-01",
      datastore  = "datastore1",
      vsphere_cluster = "Cluster01",
      network    = "Local-Network",
      ip         = "192.168.0.4",
      cpu        = 4,
      memory     = 8192,
      disk_size  = 100
    },
    "LDAP_02" = {
      datacenter = "NCH-01",
      datastore  = "datastore1",
      vsphere_cluster = "Cluster01",
      network    = "Local-Network",
      ip         = "192.168.0.5",
      cpu        = 4,
      memory     = 8192,
      disk_size  = 100
    },
    "GitLab-EE" = {
      datacenter = "NCH-01",
      datastore  = "datastore1",
      vsphere_cluster = "Cluster01",
      network    = "Local-Network",
      ip         = "192.168.0.6",
      cpu        = 4,
      memory     = 8192,
      disk_size  = 100
    }
  }
}

# Create VMs using the module
module "vms" {
  source   = "../../modules/vsphere-vm"
  for_each = local.vms

  vsphere_datacenter = each.value.datacenter
  vsphere_datastore  = each.value.datastore
  vsphere_cluster    = each.value.vsphere_cluster
  vsphere_network    = each.value.network
  
  template_name = var.template_name
  vm_name       = each.key  # Using the actual VM name directly instead of a prefix
  vm_cpu        = each.value.cpu
  vm_memory     = each.value.memory
  vm_disk_size  = each.value.disk_size
  vm_domain     = var.vm_domain
  
  vm_ip         = each.value.ip
  vm_gateway    = var.vm_gateway
  vm_dns_servers = var.vm_dns_servers
}
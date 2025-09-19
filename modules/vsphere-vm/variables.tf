variable "vsphere_datacenter" {
  description = "vSphere datacenter name"
  type        = string
}

variable "vsphere_datastore" {
  description = "vSphere datastore name"
  type        = string
}

variable "vsphere_cluster" {
  description = "vSphere cluster name"
  type        = string
}

variable "vsphere_network" {
  description = "vSphere network name"
  type        = string
}

variable "template_name" {
  description = "Name of the VM template to clone"
  type        = string
  default     = "Ubuntu-2204-Template"
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_cpu" {
  description = "Number of vCPUs"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Memory in MB"
  type        = number
  default     = 4096
}

variable "vm_disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 50
}

variable "vm_domain" {
  description = "Domain name for the VM"
  type        = string
  default     = "local"
}

variable "vm_ip" {
  description = "IP address for the VM"
  type        = string
}

variable "vm_netmask" {
  description = "Network mask length (e.g., 24 for /24)"
  type        = number
  default     = 24
}

variable "vm_gateway" {
  description = "Default gateway for the VM"
  type        = string
}

variable "vm_dns_servers" {
  description = "List of DNS servers"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "tags" {
  description = "Tags to apply to the VM"
  type        = map(string)
  default     = {}
}
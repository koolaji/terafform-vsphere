variable "vsphere_user" {
  description = "vSphere username"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "vSphere server address"
  type        = string
}

variable "template_name" {
  description = "Name of the VM template to clone"
  type        = string
  default     = "Ubuntu-2204-Template"
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "ubuntu-server"
}

variable "vm_domain" {
  description = "Domain name for VMs"
  type        = string
  default     = "example.com"
}

variable "vm_gateway" {
  description = "Default gateway for VMs"
  type        = string
}

variable "vm_dns_servers" {
  description = "List of DNS servers"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}
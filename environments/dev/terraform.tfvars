# vSphere connection details
vsphere_user     = "administrator@vsphere.local"
vsphere_password = "your-password-here"
vsphere_server   = "192.168.0.2"

# VM template to use
template_name    = "Ubuntu-2204-Template"

# VM naming
vm_name_prefix   = "ubuntu-server"
vm_domain        = "local"

# Network configuration
vm_gateway       = "192.168.0.1"
vm_dns_servers   = ["8.8.8.8", "8.8.4.4"]
output "vm_details" {
  description = "Details of all created VMs"
  value = {
    for name, vm in module.vms : name => {
      name        = vm.vm_name
      ip_address  = vm.vm_ip_address
      id          = vm.vm_id
      uuid        = vm.vm_uuid
    }
  }
}

output "vm_ips" {
  description = "IP addresses of all VMs"
  value = {
    for name, vm in module.vms : vm.vm_name => vm.vm_ip_address
  }
}
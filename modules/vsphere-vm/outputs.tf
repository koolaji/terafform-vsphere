output "vm_id" {
  description = "ID of the VM"
  value       = vsphere_virtual_machine.vm.id
}

output "vm_name" {
  description = "Name of the VM"
  value       = vsphere_virtual_machine.vm.name
}

output "vm_ip_address" {
  description = "IP address of the VM"
  value       = vsphere_virtual_machine.vm.default_ip_address
}

output "vm_uuid" {
  description = "UUID of the VM"
  value       = vsphere_virtual_machine.vm.uuid
}

output "vm_hardware_version" {
  description = "Hardware version of the VM"
  value       = vsphere_virtual_machine.vm.hardware_version
}
# Project structure:
#
# ├── environments/
# │   ├── dev/
# │   │   ├── main.tf
# │   │   ├── terraform.tfvars
# │   │   └── variables.tf
# │   ├── prod/
# │   │   ├── main.tf
# │   │   ├── terraform.tfvars
# │   │   └── variables.tf
# │   └── staging/
# │       ├── main.tf
# │       ├── terraform.tfvars
# │       └── variables.tf
# ├── modules/
# │   ├── vsphere-vm/
# │   │   ├── main.tf
# │   │   ├── outputs.tf
# │   │   └── variables.tf
# │   └── vsphere-network/
# │       ├── main.tf
# │       ├── outputs.tf
# │       └── variables.tf
# └── README.md

This is a more maintainable structure for your Terraform project. Each environment 
(dev, staging, prod) has its own configuration, and common functionality is 
extracted into reusable modules.

To deploy VMs in a specific environment:
1. Navigate to the environment directory (e.g., cd environments/dev)
2. Run terraform init and terraform apply

Each environment can have different configurations while using the same underlying modules.
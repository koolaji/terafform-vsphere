# Ubuntu vSphere Templates with Packer

This repository contains Packer configurations for creating Ubuntu VM templates in VMware vSphere.

## Prerequisites

### Install Packer
```bash
sudo apt update
sudo apt install -y packer
```

Alternatively, you can download the latest version from the [official Packer website](https://www.packer.io/downloads).

## Available Templates

### Ubuntu 18.04 LTS
- Located in the `Ubuntu-18.04` directory
- Uses preseed for automated installation

### Ubuntu 22.04 LTS
- Located in the `Ubuntu-22.04` directory
- Uses cloud-init autoinstall for automated installation

## How to Use

1. Navigate to the directory for the Ubuntu version you want to build:
   ```bash
   cd Ubuntu-18.04
   # or
   cd Ubuntu-22.04
   ```

2. Edit the variables file to match your environment:
   - For Ubuntu 18.04: `variables-json.txt`
   - For Ubuntu 22.04: `variables.json`

3. Build the template with Packer:
   ```bash
   # For Ubuntu 18.04
   packer build -var-file=variables-json.txt ubuntu18-thick.json
   
   # For Ubuntu 22.04
   packer build -var-file=variables.json ubuntu22-thick.json
   ```

   You can also override specific variables on the command line:
   ```bash
   packer build -var-file=variables.json -var 'vm-name=Ubuntu-2204-Custom' -var 'vm-cpu-num=4' ubuntu22-thick.json
   ```

## Working with Variables

### Variable Files
The variable files (`variables.json` for Ubuntu 22.04) contain all the configuration values needed for your build:

```json
{
  "vm-name": "Ubuntu-2204-Template",
  "vcenter-server": "192.168.x.x",
  "vcenter-username": "administrator@vsphere.home",
  "vcenter-password": "xxxxx",
  ...
}
```

### Variable Types
- **Required variables**: Must be provided in the variables file or via command line
- **Optional variables**: Have default values in the template

### Providing Variables
You can provide variables in three ways:
1. **In the variables file** (recommended for most settings)
2. **Command line** with `-var` flag (good for one-off changes)
3. **Environment variables** prefixed with `PKR_VAR_` (useful for sensitive data)

Example with environment variables:
```bash
export PKR_VAR_vcenter_password="your-secure-password"
packer build -var-file=variables.json ubuntu22-thick.json
```

## Excluding Sensitive Files from Git

To prevent sensitive files (like your variables.json with passwords) from being tracked in Git:

1. Create a template variables file without sensitive data:
   ```bash
   # Create a template file
   cp variables.json variables.json.template
   # Edit the template to remove sensitive data
   ```

2. Add the actual variables file to .gitignore:
   ```bash
   # Create or edit .gitignore file
   echo "variables.json" >> .gitignore
   echo "*-variables.json" >> .gitignore
   echo "*.pkrvars.hcl" >> .gitignore
   ```

3. Use the template as a reference:
   ```bash
   # When setting up a new environment
   cp variables.json.template variables.json
   # Then edit variables.json with your actual values
   ```

4. For team environments, consider using a secure method to share sensitive values (password manager, secrets management tool, etc.)

## Configuration Notes

### Ubuntu 18.04
- Uses traditional preseed configuration
- Make sure to rename `sample-preseed.cfg` to `preseed.cfg` before building

### Ubuntu 22.04
- Uses the newer cloud-init autoinstall method
- The default username is `username` with password `xxxx` (please change this)
- Includes open-vm-tools and other essential packages

## Security Considerations
- Remember to change default passwords in the configuration files
- Consider using Packer variables for sensitive information
- The user created has sudo privileges without password (adjust as needed)
- Store sensitive variables in environment variables rather than in files
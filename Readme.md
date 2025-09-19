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
#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Define netboot directory and image path
netboot_dir="/tmp/netboot"
netboot_url="https://boot.netboot.xyz/ipxe/netboot.xyz.img"
netboot_path="$netboot_dir/netboot.xyz.img"

# Create /tmp/netboot/ directory if it doesn't exist
mkdir -p "$netboot_dir"

# Clear /tmp/netboot/ directory
find "$netboot_dir" -mindepth 1 -delete

# Install required packages if missing
required_packages=("qemu-system" "wget" "qemu-utils" "qemu-system-gui" "xdotool" "ovmf")
for pkg in "${required_packages[@]}"; do
    if ! dpkg -l | grep -qw "$pkg"; then
        echo "Installing $pkg..."
        apt update && apt install -y "$pkg"
    fi
done

# Prompt user for RAM allocation
echo -n "Enter amount of RAM in MB to use for VM (or press Enter to use 4GB): "
read -r vm_ram
vm_ram=${vm_ram:-4096}  # Default to 4096MB if no input is provided

# Download netboot.xyz image to /tmp/netboot/
echo "Downloading netboot.xyz image..."
wget --progress=bar:force:noscroll -O "$netboot_path" "$netboot_url"
if [[ $? -ne 0 ]]; then
    echo "Failed to download netboot.xyz image."
    exit 1
fi

# Start a VM with QEMU using the netboot.xyz file with user-defined RAM, KVM acceleration, and CPU optimization
echo "Starting QEMU virtual machine with $vm_ram MB of RAM..."
(qemu-system-x86_64 -enable-kvm -cpu host -m "$vm_ram" -drive format=raw,file="$netboot_path" &) &

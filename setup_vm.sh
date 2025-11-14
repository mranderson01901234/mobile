#!/bin/bash

# VirtualBox macOS VM Setup Script
# Run this on your Linux host to configure the VM

VM_NAME="macOS-Development"

echo "🍎 Setting up macOS VM in VirtualBox..."
echo "VM Name: $VM_NAME"
echo ""

# Check if VM exists
if ! VBoxManage showvminfo "$VM_NAME" &>/dev/null; then
    echo "❌ VM '$VM_NAME' not found!"
    echo "Please create the VM in VirtualBox first, then run this script."
    exit 1
fi

echo "✅ VM found. Configuring settings..."

# Configure CPU IDs (required for macOS)
echo "📝 Setting CPU IDs..."
VBoxManage modifyvm "$VM_NAME" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff

# Configure DMI system product
echo "📝 Configuring DMI system product..."
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac19,1"
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-AA95B1DDAB278B95"

# Configure SMC
echo "📝 Configuring SMC..."
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "$VM_NAME" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

# Enable I/O APIC
echo "📝 Enabling I/O APIC..."
VBoxManage modifyvm "$VM_NAME" --ioapic on

# Enable EFI
echo "📝 Enabling EFI..."
VBoxManage modifyvm "$VM_NAME" --firmware efi

# Set chipset
echo "📝 Setting chipset..."
VBoxManage modifyvm "$VM_NAME" --chipset ich9

# Configure USB
echo "📝 Configuring USB..."
VBoxManage modifyvm "$VM_NAME" --usb on
VBoxManage modifyvm "$VM_NAME" --usbehci on

echo ""
echo "✅ VM configuration complete!"
echo ""
echo "Next steps:"
echo "1. Insert macOS installer ISO in VM storage"
echo "2. Start the VM"
echo "3. Install macOS"
echo "4. Install Xcode"
echo ""
echo "For detailed instructions, see VIRTUALBOX_MAC_SETUP.md"


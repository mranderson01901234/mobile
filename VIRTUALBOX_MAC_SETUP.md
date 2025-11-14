# Setting Up macOS in VirtualBox for iOS Development

## 🎯 Goal: Run macOS + Xcode in VirtualBox to Develop iOS Apps

## ⚠️ Important Legal Note

macOS license requires Apple hardware. Using macOS in a VM on non-Apple hardware violates Apple's EULA. This guide is for educational purposes. Consider using a cloud Mac service for production work.

## 📋 Prerequisites

- ✅ VirtualBox installed (you have this!)
- ✅ At least 8GB RAM (16GB recommended)
- ✅ 100GB+ free disk space
- ✅ CPU with virtualization support (VT-x/AMD-V)
- ✅ macOS installer image (.dmg or .iso)

## 🚀 Step 1: Get macOS Installer

### Option A: Download from Apple (Requires Mac)
If you have access to a Mac temporarily:
1. Download macOS from App Store
2. Create installer USB or convert to ISO

### Option B: Use Pre-made VM Image
Some developers share macOS VMs (check legality in your region):
- Search for "macOS VirtualBox image"
- Use at your own risk

### Option C: Use macOS Recovery
- Requires Apple hardware serial number
- Complex setup

**Recommended:** Get macOS installer from Apple Developer (if you have access) or use a pre-made VM image.

## 🔧 Step 2: Configure VirtualBox

### Create New VM:

1. **Open VirtualBox**
2. **Click "New"**
3. **Configure VM:**

```
Name: macOS-Development
Type: Mac OS X
Version: macOS 12 (Monterey) or macOS 13 (Ventura)
```

4. **Memory (RAM):**
   - **Minimum:** 4096 MB (4GB)
   - **Recommended:** 8192 MB (8GB) or more
   - **For Xcode:** 16384 MB (16GB) ideal

5. **Hard Disk:**
   - **Create virtual hard disk**
   - **VDI (VirtualBox Disk Image)**
   - **Dynamically allocated**
   - **Size: 100GB minimum** (150GB+ recommended for Xcode)

### Configure VM Settings:

**Before first boot, configure these settings:**

1. **System → Motherboard:**
   ```
   ✅ Enable I/O APIC
   ✅ Enable EFI
   Chipset: PIIX3
   ```

2. **System → Processor:**
   ```
   ✅ Enable PAE/NX
   Processors: 2-4 cores (use half your CPU cores)
   ✅ Enable Nested VT-x/AMD-V (if available)
   Execution Cap: 100%
   ```

3. **Display → Screen:**
   ```
   Video Memory: 128 MB
   ✅ Enable 3D Acceleration
   ```

4. **Storage:**
   - **Controller SATA:** Add macOS installer ISO
   - **Controller SATA:** Add empty optical drive

5. **USB:**
   ```
   ✅ Enable USB Controller
   USB 3.0 (xHCI) Controller
   ```

## 🍎 Step 3: Install macOS

### Before First Boot:

1. **Open Terminal** (on Linux host)
2. **Navigate to VirtualBox directory:**
   ```bash
   cd ~/VirtualBox\ VMs/macOS-Development/
   ```

3. **Run these commands** (adjust VM name):
   ```bash
   VBoxManage modifyvm "macOS-Development" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
   VBoxManage setextradata "macOS-Development" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac19,1"
   VBoxManage setextradata "macOS-Development" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-AA95B1DDAB278B95"
   VBoxManage setextradata "macOS-Development" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
   VBoxManage setextradata "macOS-Development" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
   ```

### Install macOS:

1. **Start VM**
2. **Boot from installer**
3. **Follow macOS installation:**
   - Select language
   - Disk Utility → Erase disk (APFS)
   - Install macOS
   - Wait 30-60 minutes

4. **Complete setup:**
   - Create user account
   - Skip Apple ID (or add later)
   - Complete setup

## 📦 Step 4: Install Xcode

### In macOS VM:

1. **Open App Store**
2. **Search "Xcode"**
3. **Click "Get"** (free, but requires Apple ID)
4. **Wait for download** (~12GB, takes time)
5. **Install Xcode**
6. **Open Xcode** → Accept license
7. **Install Command Line Tools:**
   ```bash
   xcode-select --install
   ```

## 🔌 Step 5: Enable USB Passthrough (For iPhone)

### To Connect iPhone:

1. **In VirtualBox:**
   - Settings → USB
   - Add USB filter for your iPhone
   - Or enable USB 3.0 controller

2. **In macOS VM:**
   - Install iTunes or Finder will recognize iPhone
   - Trust computer on iPhone

3. **In Xcode:**
   - iPhone should appear in device list
   - Select iPhone → Build and Run

## 📁 Step 6: Transfer Your Project

### Option A: Shared Folder

1. **In VirtualBox:**
   - Settings → Shared Folders
   - Add shared folder: `/home/dp/Desktop/mobile1.0`
   - Auto-mount: ✅
   - Mount point: `/media/sf_mobile1.0`

2. **In macOS VM:**
   ```bash
   # Access shared folder
   cd /Volumes/sf_mobile1.0
   # Or check /media/sf_mobile1.0
   
   # Copy to macOS
   cp -r /Volumes/sf_mobile1.0 ~/Desktop/mobile1.0
   ```

### Option B: Git Clone

```bash
# In macOS VM:
cd ~/Desktop
git clone https://github.com/mranderson01901234/mobile.git
```

### Option C: Network Share

```bash
# On Linux host, share folder:
# Then access from macOS via SMB
```

## 🎨 Step 7: Set Up Xcode Project

1. **Open Xcode** in macOS VM
2. **File → New → Project**
3. **iOS → App**
4. **Configure:**
   - Product Name: iOSLocalAIAssistant
   - Interface: SwiftUI
   - Language: Swift
5. **Save in:** `~/Desktop/mobile1.0/`
6. **Add existing files** (drag folders)
7. **Open ContentView.swift**
8. **Press `⌘ + ⌥ + Return`** for Canvas
9. **Click "Resume"** → See live UI! 🎉

## ⚡ Performance Optimization

### VM Settings:
```
- Allocate more RAM (8GB+)
- Use 2-4 CPU cores
- Enable 3D acceleration
- Use SSD if possible
```

### macOS Settings:
```
- Disable Spotlight indexing (temporary)
- Close unnecessary apps
- Use lighter macOS version (Monterey vs Ventura)
```

### Xcode Settings:
```
- Disable Source Control (if not using)
- Reduce indexing scope
- Close unused projects
```

## 🐛 Troubleshooting

### VM Won't Boot:
- Check CPU virtualization enabled in BIOS
- Verify EFI settings
- Try different macOS version

### Slow Performance:
- Allocate more RAM
- Use fewer CPU cores (sometimes helps)
- Disable visual effects in macOS
- Close other VMs/apps

### USB Not Working:
- Install VirtualBox Extension Pack
- Check USB filters
- Try USB 2.0 instead of 3.0

### Xcode Crashes:
- Allocate more RAM (16GB+)
- Use macOS Monterey (more stable)
- Update VirtualBox to latest version

## 📊 Expected Performance

| Task | Speed | Notes |
|------|-------|-------|
| macOS Boot | 🐢 Slow (2-5 min) | Normal for VM |
| Xcode Launch | 🐢 Slow (1-2 min) | First time slower |
| Canvas Preview | 🐢 Slow (5-10 sec) | But works! |
| Build | 🐢 Slow (2-5 min) | Depends on project |
| Simulator | 🐢 Slow | Usable but laggy |

**It's slower than real Mac, but functional!**

## 🎯 Quick Start Checklist

- [ ] VirtualBox installed ✅
- [ ] macOS installer obtained
- [ ] VM created (8GB+ RAM, 100GB+ disk)
- [ ] macOS installed
- [ ] Xcode installed
- [ ] Project transferred
- [ ] Xcode project created
- [ ] Canvas preview working
- [ ] Ready to develop! 🎉

## 💡 Pro Tips

1. **Take snapshots** before major changes
2. **Use shared folders** for code sync
3. **Keep VM updated** (security)
4. **Use Git** to sync between host and VM
5. **Consider cloud Mac** if VM too slow

---

**Once set up, you'll have full macOS + Xcode for iOS development!** 🚀


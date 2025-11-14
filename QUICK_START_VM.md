# Quick Start: macOS VM Setup

## 🚀 Fastest Path to iOS Development

### Step 1: Get macOS Installer

**You need a macOS installer image (.iso or .dmg)**

Options:
- Download from Apple (requires Mac)
- Use pre-made VM image (search online)
- Get from friend/colleague with Mac

### Step 2: Create VM in VirtualBox

1. **Open VirtualBox**
2. **Click "New"**
3. **Settings:**
   ```
   Name: macOS-Development
   Type: Mac OS X
   Version: macOS 12 (Monterey)
   RAM: 8192 MB (8GB) - more is better
   Hard Disk: 100GB+ (dynamically allocated)
   ```

### Step 3: Run Setup Script

```bash
cd /home/dp/Desktop/mobile1.0
./setup_vm.sh
```

This configures the VM for macOS.

### Step 4: Install macOS

1. **Add macOS installer ISO** to VM storage
2. **Start VM**
3. **Boot from installer**
4. **Install macOS** (follow on-screen instructions)
5. **Wait 30-60 minutes**

### Step 5: Install Xcode

In macOS VM:
1. Open **App Store**
2. Search **"Xcode"**
3. Click **"Get"** (free, ~12GB download)
4. Wait for download/install
5. Open Xcode → Accept license

### Step 6: Transfer Project

**Option A: Git Clone (Easiest)**
```bash
# In macOS VM:
cd ~/Desktop
git clone https://github.com/mranderson01901234/mobile.git
cd mobile
```

**Option B: Shared Folder**
1. VirtualBox → Settings → Shared Folders
2. Add: `/home/dp/Desktop/mobile1.0`
3. In macOS: Access via `/Volumes/sf_mobile1.0`

### Step 7: Create Xcode Project

1. **Open Xcode**
2. **File → New → Project**
3. **iOS → App**
4. **Settings:**
   ```
   Product Name: iOSLocalAIAssistant
   Interface: SwiftUI ✅
   Language: Swift ✅
   ```
5. **Save in:** `~/Desktop/mobile/`
6. **Add existing files:**
   - Drag `App/`, `Models/`, `Views/`, etc. folders into Xcode
   - Uncheck "Copy items"
   - Check "Create groups"
   - Check target

### Step 8: Enable Live Previews! 🎉

1. **Open `ContentView.swift`**
2. **Press `⌘ + ⌥ + Return`** (or Editor → Canvas)
3. **Click "Resume"**
4. **See UI live!**

### Step 9: Test on Simulator

1. **Select Simulator:** iPhone 15 Pro (or any)
2. **Press `⌘ + R`** to run
3. **App launches in simulator**
4. **Make changes → Rebuild → See updates**

## ⚡ Performance Tips

- **Allocate 16GB RAM** if possible (Xcode needs it)
- **Use 2-4 CPU cores** (don't use all cores)
- **Enable 3D acceleration** in VM settings
- **Close other apps** in VM for better performance

## 🐛 Common Issues

### VM Won't Boot
- Check BIOS: Enable virtualization (VT-x/AMD-V)
- Try different macOS version
- Check VM settings match guide

### Xcode Too Slow
- Allocate more RAM (16GB+)
- Use macOS Monterey (lighter than Ventura)
- Close other apps
- Disable Spotlight indexing temporarily

### USB Not Working
- Install VirtualBox Extension Pack
- Check USB filters in VM settings
- Try USB 2.0 instead of 3.0

## 📊 Expected Timeline

- **VM Setup:** 10 minutes
- **macOS Install:** 30-60 minutes
- **Xcode Download:** 1-2 hours (depends on internet)
- **Xcode Install:** 30 minutes
- **Project Setup:** 10 minutes
- **Total:** ~3-4 hours first time

**But then you're ready to develop!** 🎉

## 🎯 What You'll Have

✅ Full macOS environment
✅ Xcode with SwiftUI
✅ Live Canvas previews
✅ iOS Simulator
✅ Ability to build for iPhone
✅ All iOS development tools

---

**See `VIRTUALBOX_MAC_SETUP.md` for detailed instructions!**


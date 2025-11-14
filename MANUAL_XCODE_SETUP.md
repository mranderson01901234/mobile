# Manual Xcode Project Setup

If the automated script doesn't work, follow these steps:

## Step 1: Open Xcode
- Launch Xcode on macOS

## Step 2: Create New Project
- File → New → Project
- Choose: **iOS** → **App**
- Click **Next**

## Step 3: Configure Project
- **Product Name:** iOSLocalAIAssistant
- **Team:** Select your Apple ID
- **Organization Identifier:** com.localaiassistant
- **Interface:** SwiftUI ✅
- **Language:** Swift ✅
- **Storage:** None
- **Click Next**

## Step 4: Save Location
- Navigate to: 
- **Uncheck** "Create Git repository" (we already have one)
- Click **Create**

## Step 5: Delete Default Files
- Delete  (we have our own)
- Delete  (we'll use our own)

## Step 6: Add Existing Files
Drag these folders into Xcode (left sidebar):
-  folder
-  folder
-  folder
-  folder
-  folder
-  folder
-  file
-  file

**Important:**
- ✅ Uncheck "Copy items if needed"
- ✅ Check "Create groups"
- ✅ Check "iOSLocalAIAssistant" target

## Step 7: Set App Entry Point
- Make sure  is the main file
- Check: Target → Build Phases → Compile Sources

## Step 8: Configure Info.plist
- Target → Info
- Set iOS Deployment Target: 17.0
- Add required permissions if needed

## Step 9: Build
- Press  to build
- Fix any import errors
- Press  to run

## Step 10: Enable Canvas
- Open 
- Press 
- Click "Resume"
- See live UI! 🎉

Done! Your Xcode project is ready.

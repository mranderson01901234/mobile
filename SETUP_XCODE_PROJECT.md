# Quick Setup: Xcode Project for Live UI Previews

## ⚡ Fastest Way to See Live UI

Your Swift files already have `#Preview` blocks! You just need an Xcode project.

## 🎯 Step-by-Step (5 minutes)

### 1. Open Xcode
- Launch Xcode on your Mac
- If you don't have Xcode: Download from Mac App Store (free, ~12GB)

### 2. Create New Project
```
File → New → Project
→ iOS → App
→ Click "Next"
```

### 3. Configure Project
```
Product Name: iOSLocalAIAssistant
Team: (Select your Apple ID)
Organization Identifier: com.yourname
Interface: SwiftUI ✅
Language: Swift ✅
Storage: None (we'll add files manually)
→ Click "Next"
→ Save in: /home/dp/Desktop/mobile1.0/
→ Click "Create"
```

### 4. Delete Default Files
- Delete `ContentView.swift` (we have our own)
- Delete `iOSLocalAIAssistantApp.swift` (we'll create our own)

### 5. Add All Your Files
**Drag these folders into Xcode** (left sidebar):
- `App/` folder
- `Models/` folder  
- `Views/` folder
- `ViewModels/` folder
- `Services/` folder
- `Utilities/` folder

**Important:** 
- ✅ Uncheck "Copy items if needed" (files already exist)
- ✅ Check "Create groups" 
- ✅ Check "iOSLocalAIAssistant" target

### 6. Create App Entry Point
Create new file: `iOSLocalAIAssistantApp.swift`

```swift
import SwiftUI

@main
struct iOSLocalAIAssistantApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 7. Update Info.plist
Add to `Info.plist`:
```xml
<key>UIApplicationSceneManifest</key>
<dict>
    <key>UIApplicationSupportsMultipleScenes</key>
    <true/>
</dict>
```

### 8. Enable Live Previews! 🎉
1. Open `ContentView.swift`
2. Press `⌘ + ⌥ + Return` (or Editor → Canvas → Show Canvas)
3. Click **"Resume"** button
4. **You'll see the UI!**

## 🎨 Using Live Previews

### See Changes Instantly
1. **Edit any SwiftUI code** in `ContentView.swift` or other views
2. **Preview updates automatically** - no rebuild needed!
3. **Click "Live" button** to interact with UI

### Example: Change Text Color
```swift
// In ContentView.swift, change:
Text("Your AI That Keeps Secrets")
    .font(UIConstants.displayLarge)
    .foregroundColor(.blue)  // ← Add this, see it change instantly!
```

### Preview Different Devices
```swift
#Preview("iPhone 15 Pro") {
    ContentView()
        .previewDevice("iPhone 15 Pro")
}

#Preview("iPad") {
    ContentView()
        .previewDevice("iPad Pro (12.9-inch)")
}
```

## 🚀 Run on Simulator

1. **Select simulator:** iPhone 15 Pro (or any)
2. **Press `⌘ + R`** to run
3. **App launches in simulator**
4. **Make changes → Press `⌘ + R` again** to see updates

## 💡 Pro Tips

### Hot Reload Alternative
If previews are slow, use:
- **InjectionIII** (third-party hot reload tool)
- Or just rebuild (`⌘ + R`) - it's fast in Xcode

### Multiple Previews
You can preview multiple states at once:
```swift
#Preview("Onboarding") {
    OnboardingView(coordinator: AppCoordinator())
}

#Preview("Main App") {
    MainTabView()
}
```

### Interactive Mode
Click **"Interactive"** button in preview to:
- Tap buttons
- Type in text fields
- Scroll lists
- Test navigation

## 🐛 Troubleshooting

### "Cannot preview in this file"
- Make sure file has `#Preview` block
- Check for syntax errors
- Try: Product → Clean Build Folder

### Preview Not Updating
- Click "Resume" button
- Or: Editor → Canvas → Refresh Canvas

### Missing Dependencies
- Make sure all imports are correct
- Check that all files are added to target

## 📱 Testing on Real Device

1. **Connect iPhone** via USB
2. **Trust computer** on iPhone
3. **Select device** in Xcode toolbar
4. **Press `⌘ + R`** to install and run
5. **See app on your phone!**

---

**Once set up, you can edit UI code and see changes instantly!** 🎉


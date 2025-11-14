# Live UI Preview Setup Guide

## 🎯 Goal: See UI Changes in Real-Time

To see the iOS app UI update live as you code, you need **Xcode with SwiftUI Previews**.

## 📋 Prerequisites

1. **Mac with macOS** (required for Xcode)
2. **Xcode 15.0+** installed
3. **iOS Simulator** or physical iPhone

## 🚀 Step-by-Step Setup

### Step 1: Create Xcode Project

Since we only have Swift files, we need to create an Xcode project:

```bash
# Option A: Create new Xcode project manually
# 1. Open Xcode
# 2. File → New → Project
# 3. Choose "iOS" → "App"
# 4. Name: "iOSLocalAIAssistant"
# 5. Interface: SwiftUI
# 6. Language: Swift
# 7. Save in: /home/dp/Desktop/mobile1.0/

# Option B: Use command line (if you have Xcode Command Line Tools)
# This is more complex - manual is easier
```

### Step 2: Add Existing Files to Xcode

1. **Drag folders into Xcode:**
   - Drag `App/` folder into Xcode project
   - Drag `Models/` folder
   - Drag `Views/` folder
   - Drag `ViewModels/` folder
   - Drag `Services/` folder
   - Drag `Utilities/` folder

2. **Make sure "Copy items if needed" is UNCHECKED** (files already exist)

3. **Add to target:** Check "iOSLocalAIAssistant" target

### Step 3: Enable Live Previews

SwiftUI Previews are already built into your views! Look for `#Preview` blocks:

```swift
#Preview {
    ContentView()
}
```

### Step 4: Open Preview Canvas

1. **In Xcode:** Click the **"Resume"** button in the preview pane (or press `⌘ + ⌥ + Return`)
2. **Or:** Editor → Canvas → Show Canvas

### Step 5: Enable Live Editing

1. **Click the "Live" button** in the preview toolbar (looks like a play button)
2. **Make changes** to your SwiftUI code
3. **Preview updates automatically!**

## 🎨 How Live Previews Work

### Example: Editing `ContentView.swift`

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")  // ← Change this
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()  // ← This shows in preview pane
}
```

**When you edit:**
- Type changes → Preview updates instantly
- No need to rebuild
- See results immediately

## 🔥 Pro Tips for Live Development

### 1. Multiple Previews

You can preview different states:

```swift
#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}

#Preview("iPhone SE") {
    ContentView()
        .previewDevice("iPhone SE (3rd generation)")
}
```

### 2. Preview with Data

```swift
#Preview {
    ChatView(viewModel: ChatViewModel(
        conversation: .empty,
        inferenceEngine: InferenceEngine(),
        modelManager: ModelManager()
    ))
}
```

### 3. Interactive Previews

Click the **"Interactive"** button in preview toolbar to actually interact with buttons, text fields, etc.

## 🛠️ Alternative: Fast Refresh with Simulator

If previews don't work, use the simulator with fast refresh:

1. **Run app** (`⌘ + R`)
2. **Make code changes**
3. **Press `⌘ + R` again** to rebuild (or enable automatic rebuild)

## 📱 Using Physical Device

1. **Connect iPhone via USB**
2. **Select device** in Xcode toolbar
3. **Run** (`⌘ + R`)
4. **App installs on device**
5. **Changes require rebuild** (not instant like previews)

## ⚡ Quick Setup Script

I can create a script to help set up the Xcode project automatically. Would you like me to create it?

## 🐛 Troubleshooting

### Preview Not Showing?
- Make sure you're on a Mac with Xcode
- Check that `#Preview` blocks exist in your views
- Try: Product → Clean Build Folder (`⌘ + Shift + K`)

### Preview Crashes?
- Check for syntax errors
- Make sure all dependencies are imported
- Check console for error messages

### Can't See Changes?
- Click "Resume" in preview pane
- Try: Editor → Canvas → Refresh Canvas
- Restart Xcode if needed

## 🎯 Next Steps

1. **Create Xcode project** (if you haven't)
2. **Add all Swift files** to project
3. **Open any view file** (like `ContentView.swift`)
4. **Enable Canvas** (`⌘ + ⌥ + Return`)
5. **Start coding and see live updates!**

---

**Note:** Live previews only work in Xcode on macOS. If you're on Linux/Windows, you'll need to use a Mac or Mac VM for iOS development.


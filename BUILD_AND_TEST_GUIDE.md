# Build & Test Guide - Phase 2 Week 1

**iOS Local AI Assistant - Preview System**
**Date:** 2025-11-14
**Status:** Ready for Testing

---

## Quick Start (5 Minutes)

### Step 1: Create Xcode Project Structure

You already have all the Swift files. Now create the Xcode project wrapper:

```bash
cd /home/user/mobile

# Create the Xcode project structure
# (You need to open Xcode and create a new iOS App project, or use the existing structure)

# Option A: If you have Xcode installed
open -a Xcode .

# Option B: Using command line (creates basic structure)
xcodebuild -showsdks
```

### Step 2: Open in Xcode

```bash
# Open the project/workspace
open /home/user/mobile/LocalAI.xcodeproj
# or if using workspace
open /home/user/mobile/LocalAI.xcworkspace
```

### Step 3: Configure Build Settings

**In Xcode (if not already set):**

1. **Project Settings:**
   - Product Name: `LocalAI`
   - Bundle Identifier: `com.localai.mobile`
   - Minimum Deployment Target: `iOS 17.0`
   - Supported Platforms: `iPhone`

2. **Build Settings:**
   - Swift Language Version: `Swift 5.9` or later
   - Debug Optimization: `-O0` (None)
   - Release Optimization: `-Owholemodule`

### Step 4: Build & Run

```bash
# Option A: Using Xcode GUI
# 1. Select iPhone 15 Pro simulator (top of window)
# 2. Product → Run (or press Cmd+R)

# Option B: Using command line
xcodebuild build \
  -scheme LocalAI \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'

# Option C: Build and run in one command
xcodebuild build-and-run \
  -scheme LocalAI \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

---

## What You Should See

### App Launch

```
┌─────────────────────────────────┐
│  LocalAI                     🔒 │
│                                 │
│  (App loads with tab bar)       │
└─────────────────────────────────┘
```

### Default Tab (Components)

The app defaults to the **Components tab**, showing:

```
┌─────────────────────────────────┐
│ Design System            ☀️/🌙  │  ← Dark mode toggle
├─────────────────────────────────┤
│                                 │
│  COLORS                         │
│  ⬜ Background                 │
│  ⬜ Secondary Background       │
│  ⬜ Tertiary Background        │
│  ⬜ Text Primary               │
│  ⬜ Text Secondary             │
│  ⬜ Text Tertiary              │
│  ━━ Border                     │
│  🔵 Accent (Blue)              │
│  🟢 Success (Green)            │
│  🟠 Warning (Orange)           │
│  🔴 Error (Red)                │
│                                 │
│  TYPOGRAPHY                     │
│  Display Large (32pt Bold)     │
│  Display Small (28pt Bold)     │
│  Heading Large (24pt Semibold) │
│  Heading Medium (20pt)         │
│  Heading Small (18pt)          │
│  Body Large (16pt)             │
│  Body Medium (15pt)            │
│  Body Small (14pt)             │
│  Label Large (13pt)            │
│  Caption (11pt)                │
│                                 │
│  BUTTONS                        │
│  ┌─────────────────────────────┐│
│  │ Primary Button (48pt)       ││
│  └─────────────────────────────┘│
│  ┌─────────────────────────────┐│
│  │ Secondary Button (outline)  ││
│  └─────────────────────────────┘│
│  ┌─────────────────────────────┐│
│  │ Disabled Button (grayed)    ││
│  └─────────────────────────────┘│
│                                 │
│  CARDS & MESSAGES               │
│  ┌─────────────────────────────┐│
│  │ Card Title                  ││
│  │ Sample card content...      ││
│  └─────────────────────────────┘│
│                                 │
│        → User message ←         │
│  ← Assistant message →          │
│                                 │
│  SPACING SCALE (8pt Grid)       │
│  xs2: 4pt   xs: 8pt            │
│  sm: 12pt   md: 16pt           │
│  lg: 24pt   xl: 32pt           │
│  xl2: 48pt  xl3: 64pt          │
│                                 │
└─────────────────────────────────┘
```

### Tab Bar (Bottom)

```
┌─────────────────────────────────┐
│ Chat  Components 🟦  Design  🔧 │
└─────────────────────────────────┘

Tab 0: Chat        (chat interface)
Tab 1: Components  (DESIGN SYSTEM) ← Currently selected
Tab 2: Design      (color/typography info)
Tab 3: Settings    (app settings)
```

---

## Testing Checklist

### ✅ Basic Launch

- [ ] App launches without crashes
- [ ] Tabs appear at bottom
- [ ] Components tab is selected by default (highlighted icon)
- [ ] ScrollView content visible and scrollable
- [ ] No console errors in Xcode

### ✅ Color Verification (Light Mode)

In **Components tab**, verify each color:

- [ ] **Background:** Bright white or very light gray
- [ ] **Secondary Background:** Slightly darker than primary (light gray)
- [ ] **Tertiary Background:** Slightly darker than secondary
- [ ] **Text Primary:** Black or very dark
- [ ] **Text Secondary:** Medium gray
- [ ] **Text Tertiary:** Light gray
- [ ] **Border:** Visible gray line
- [ ] **Accent (Blue):** Bright iOS blue (#007AFF)
- [ ] **Success (Green):** Bright iOS green (#34C759)
- [ ] **Warning (Orange):** iOS orange (#FF9500)
- [ ] **Error (Red):** iOS red (#FF3B30)

**Color Contrast Check:**
- [ ] All text readable on all backgrounds
- [ ] No color is pure black (except text)
- [ ] No color is pure white (except background)

### ✅ Typography Verification (Light Mode)

Scroll through Components tab typography section:

- [ ] **Display Large (32pt):** Largest, boldest text
- [ ] **Display Small (28pt):** Still large and bold
- [ ] **Heading Large (24pt):** Clear hierarchy
- [ ] **Body Medium (15pt):** Regular reading size
- [ ] **Caption (11pt):** Smallest readable text
- [ ] All text is black/dark in light mode
- [ ] Text hierarchy is visually clear

### ✅ Component Sizing

- [ ] **Primary Button:** Full width, 48pt tall
- [ ] **Secondary Button:** Full width, 48pt tall, outline style
- [ ] **Disabled Button:** Full width, 48pt tall, grayed out
- [ ] **Card:** Visible border, padding inside
- [ ] **Message Bubbles:** User (right side, blue), Assistant (left side, gray)
- [ ] All touch targets ≥44pt minimum

### ✅ Spacing Verification

- [ ] Padding around screen edges: 16pt
- [ ] Spacing between sections: 24pt
- [ ] Small gaps between elements: 8pt
- [ ] All spacing appears aligned to 8pt grid
- [ ] No inconsistent spacing

### ✅ Dark Mode Testing

**Tap the moon/sun button in Components tab header:**

- [ ] **Dark mode activates immediately**
- [ ] Background becomes black
- [ ] Text becomes white
- [ ] Accent (blue) remains blue and visible
- [ ] Success (green) remains green
- [ ] Warning (orange) remains orange
- [ ] Error (red) remains red
- [ ] Borders visible in dark mode (dark gray)
- [ ] All text readable (white on dark)
- [ ] No flashing or lag during transition

**Switch back to light mode:**

- [ ] Colors return to light mode versions
- [ ] Background becomes white
- [ ] Text becomes black
- [ ] Smooth transition without glitches

### ✅ Tab Navigation

Test each tab:

**Tab 0 - Chat:**
- [ ] Shows "Chat" header
- [ ] Shows "Start a conversation" message
- [ ] Input field visible with "Type a message..." placeholder
- [ ] Send button visible (arrow up circle)
- [ ] Dark mode works

**Tab 1 - Components:** (Already tested above)

**Tab 2 - Design:**
- [ ] Shows "Design System" title
- [ ] Lists 4 semantic colors with circles
- [ ] Shows typography samples
- [ ] Shows spacing description
- [ ] Dark mode works
- [ ] Scrollable if content overflows

**Tab 3 - Settings:**
- [ ] Shows "Settings" title
- [ ] Displays app information (name, version, build)
- [ ] Shows "Developer Mode" toggle
- [ ] Dark mode works
- [ ] List style consistent

### ✅ Dark Mode Across All Tabs

Toggle dark mode in Components tab, then navigate to other tabs:

- [ ] **Chat Tab:** Dark mode persists
- [ ] **Design Tab:** Dark mode persists
- [ ] **Settings Tab:** Dark mode persists
- [ ] Colors consistent across all tabs
- [ ] Text readable everywhere

### ✅ Dynamic Type Support

**On your device (or simulator):**
1. Settings → Accessibility → Display & Text Size
2. Increase text size to Large or Extra Large

- [ ] All text scales appropriately
- [ ] No text is cut off
- [ ] Layout adjusts for larger text
- [ ] App remains usable at large sizes

---

## Build Verification Commands

### Verify Compilation

```bash
# Check if code compiles without errors
xcodebuild build \
  -scheme LocalAI \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro' \
  -showBuildSettings | grep EXECUTABLE_PATH

# Should output path to built app
```

### Check Build Warnings

```bash
# Build and capture warnings
xcodebuild build \
  -scheme LocalAI \
  -configuration Debug 2>&1 | grep warning

# Should output: (no output = no warnings) ✅
```

### Verify Design Tokens

```bash
# Ensure UIConstants.swift compiles
cd /home/user/mobile
swiftc Utilities/Constants/UIConstants.swift \
  -parse -typecheck -verify 2>&1

# Should show: (no errors or warnings)
```

---

## Testing on Different Devices

### iPhone 15 Pro (Default)

```bash
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

**Screen Size:** 6.7" (large)

### iPhone 15 (Standard)

```bash
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15'
```

**Screen Size:** 6.1" (standard)

### iPhone 15 Plus (Large)

```bash
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15 Plus'
```

**Screen Size:** 6.7" (large)

### iPhone SE (Small)

```bash
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone SE (3rd generation)'
```

**Screen Size:** 4.7" (small)

**Verify:** Layout adapts well on all screen sizes

---

## Testing on Physical Device

### Prerequisites

1. iPhone with iOS 17.0 or later
2. Apple Developer account (free)
3. USB cable
4. Trust device in Xcode

### Steps

```bash
# 1. Connect iPhone via USB cable

# 2. Open Xcode
open /home/user/mobile/LocalAI.xcodeproj

# 3. In Xcode:
# - Window → Devices and Simulators
# - Select your iPhone in left panel
# - Verify "Trust" dialog appears
# - Tap "Trust" on device

# 4. Build and run
xcodebuild build-and-run \
  -scheme LocalAI \
  -configuration Debug \
  -destination 'generic/platform=iOS' \
  -allowProvisioningUpdates

# Or in Xcode:
# - Select your device (top of Xcode window)
# - Product → Run (Cmd+R)
```

### Real Device Testing

On physical iPhone, verify:

- [ ] App launches without crashes
- [ ] Colors accurate on real screen
- [ ] Text readable and properly sized
- [ ] Buttons responsive to touch
- [ ] Dark mode toggle works
- [ ] Performance smooth (no stuttering)
- [ ] Battery drain reasonable
- [ ] No thermal issues during 5-minute use

---

## Troubleshooting

### Issue: "Xcode project not found"

**Solution:**
```bash
# Create Xcode project via GUI:
# 1. Open Xcode
# 2. File → New → Project
# 3. Choose iOS → App
# 4. Configure:
#    - Product Name: LocalAI
#    - Bundle Identifier: com.localai.mobile
#    - Language: Swift
#    - Interface: SwiftUI
# 5. Save to: /home/user/mobile
```

### Issue: "Compilation Error: Cannot find 'AppColors'"

**Solution:**
```bash
# Verify UIConstants.swift is added to target
# In Xcode:
# 1. Select UIConstants.swift
# 2. File Inspector (right panel)
# 3. Check "LocalAI" in Target Membership
# 4. Clean: Product → Clean (Cmd+Shift+K)
# 5. Rebuild: Product → Build (Cmd+B)
```

### Issue: "Simulator won't start"

**Solution:**
```bash
# Reset simulator
xcrun simctl erase all

# Or delete and recreate
xcrun simctl delete unavailable
xcrun simctl create iPhone15Pro com.apple.CoreSimulator.SimDeviceType.iPhone-15-pro

# Try building again
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

### Issue: "Build fails with Swift compiler error"

**Solution:**
```bash
# Clean build folder
xcodebuild clean -scheme LocalAI

# Clear derived data
rm -rf ~/Library/Developer/Xcode/DerivedData/LocalAI-*

# Rebuild
xcodebuild build -scheme LocalAI
```

### Issue: "Colors look wrong or washed out"

**Solution:**
```bash
# Verify color definitions in UIConstants.swift
# Check that AppColors uses correct hex values:
# - #FFFFFF (white, light mode background)
# - #000000 (black, dark mode background)
# - #007AFF (blue accent)

# Force color scheme reset:
# 1. Close simulator
# 2. Erase simulator: xcrun simctl erase all
# 3. Rebuild and run
```

### Issue: "Dark mode toggle doesn't work"

**Solution:**
```bash
# Verify PreviewProvider.swift is included
# Check ContentView.swift has:
isDarkMode.toggle()

# Rebuild:
xcodebuild clean -scheme LocalAI
xcodebuild build -scheme LocalAI
```

### Issue: "App crashes on launch"

**Solution:**
```bash
# Check console output for error
# In Xcode: View → Debug Area → Console

# Common causes:
# 1. Missing design token (check UIConstants.swift)
# 2. Missing view file (check all .swift files exist)
# 3. Syntax error in SwiftUI code

# Verify all files exist:
ls -la App/LocalAIApp.swift
ls -la ContentView.swift
ls -la Views/Components/ComponentPreviewsView.swift
ls -la Utilities/Constants/UIConstants.swift
ls -la Utilities/Helpers/PreviewProvider.swift
```

---

## Performance Testing

### Monitor App Launch Time

```bash
# Build and measure launch
time xcodebuild build \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'

# Should complete in < 30 seconds for simulator
# Should complete in < 60 seconds for device
```

### Check Memory Usage

In Xcode:
1. Build and run the app
2. Debug → Gauges
3. Memory gauge shows current usage

**Expected:**
- App launch: < 100MB
- Components tab open: < 150MB
- After dark mode toggle: < 150MB
- Scrolling: No memory spikes

### Check CPU Usage

In Xcode:
1. Debug → Gauges
2. CPU gauge shows current usage

**Expected:**
- At rest: 0-5%
- Scrolling: < 20%
- Dark mode toggle: < 10%
- Tab switching: < 10%

---

## Verification Report Template

After testing, fill this out:

```
BUILD & TEST REPORT
==================

Date Tested: ________________
Tester: ____________________
Device/Simulator: ___________
iOS Version: ________________

LAUNCH
------
App launches without crash? [ ] Yes [ ] No
No console errors? [ ] Yes [ ] No

COLORS (Light Mode)
-------------------
Background is white? [ ] Yes [ ] No
Text is black? [ ] Yes [ ] No
Accent is blue? [ ] Yes [ ] No
All colors distinct? [ ] Yes [ ] No
Contrast adequate? [ ] Yes [ ] No

TYPOGRAPHY
----------
Display Large is largest? [ ] Yes [ ] No
Caption is smallest? [ ] Yes [ ] No
Hierarchy is clear? [ ] Yes [ ] No
All text readable? [ ] Yes [ ] No

SPACING
-------
Padding appears even (16pt)? [ ] Yes [ ] No
Section gaps appear correct (24pt)? [ ] Yes [ ] No
8pt grid alignment visible? [ ] Yes [ ] No

DARK MODE
---------
Toggle button works? [ ] Yes [ ] No
Colors invert correctly? [ ] Yes [ ] No
Text remains readable? [ ] Yes [ ] No
Borders visible in dark? [ ] Yes [ ] No
Mode persists across tabs? [ ] Yes [ ] No

TABS
----
Chat tab works? [ ] Yes [ ] No
Components tab works? [ ] Yes [ ] No
Design tab works? [ ] Yes [ ] No
Settings tab works? [ ] Yes [ ] No
Navigation smooth? [ ] Yes [ ] No

PERFORMANCE
-----------
App launch < 3s? [ ] Yes [ ] No
Scrolling smooth? [ ] Yes [ ] No
Dark mode toggle instant? [ ] Yes [ ] No
Memory < 150MB? [ ] Yes [ ] No

ISSUES FOUND
------------
1. ________________________
2. ________________________
3. ________________________

NEXT STEPS
----------
[ ] Ready for Phase 2 Week 2 component development
[ ] Issues need fixing before proceeding
```

---

## Next Steps After Testing

If all tests pass ✅:

1. **Phase 2 Week 2:** Build actual components
   - PrimaryButton component
   - SecondaryButton component
   - Card component
   - MessageBubble component
   - ChatInputField component

2. **Phase 2 Week 3:** Screen implementation
   - ChatView (real implementation)
   - ConversationListView
   - DocumentLibraryView
   - Full navigation

3. **Phase 2 Week 4-5:** Data & testing
   - State management
   - Persistence
   - Unit tests

---

## Quick Reference

### Build Commands

```bash
# Clean build
xcodebuild clean -scheme LocalAI

# Debug build
xcodebuild build -scheme LocalAI -configuration Debug

# Release build
xcodebuild build -scheme LocalAI -configuration Release

# Test build
xcodebuild test -scheme LocalAI

# Run on device
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'generic/platform=iOS'
```

### File Checklist

```bash
✅ App/LocalAIApp.swift
✅ ContentView.swift
✅ Views/Components/ComponentPreviewsView.swift
✅ Utilities/Constants/UIConstants.swift
✅ Utilities/Helpers/PreviewProvider.swift
```

### Important Paths

```
/home/user/mobile/
├── App/
├── Views/
├── Utilities/
├── ContentView.swift
├── LocalAI.xcodeproj (create in Xcode)
└── LocalAI.xcworkspace (if using pods)
```

---

**Ready to build? Run: `xcodebuild build -scheme LocalAI` or open in Xcode!**


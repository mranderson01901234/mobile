# Quick Build & Preview Guide

**Get the design system running in 5 minutes**

---

## The Build Process (Simple Version)

```
┌─────────────────────────────────────────────┐
│  1. Create Xcode Project                    │
│     File → New → iOS App                    │
│     (Save to /home/user/mobile)             │
└─────────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────────┐
│  2. Copy Design Tokens into Project         │
│     UIConstants.swift → Utilities/Constants/│
│     (Already exists ✓)                      │
└─────────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────────┐
│  3. Create Preview Views                    │
│     - ComponentPreviewsView                 │
│     - ContentView with tabs                 │
│     (See PHASE2_XCODE_SETUP.md)            │
└─────────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────────┐
│  4. Select Simulator/Device & Build         │
│     Product → Run (Cmd+R)                   │
│     or use: xcodebuild build ...            │
└─────────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────────┐
│  5. See Live Preview                        │
│     - Click "Components" tab                │
│     - View all colors, typography, buttons  │
│     - Toggle dark mode with button          │
│     - Edit code → preview updates instantly │
└─────────────────────────────────────────────┘
```

---

## What You'll See When You Build

### Tab 1: Chat Screen
- **View:** Clean chat interface with input field
- **Test:** Message input bar with send button
- **Verify:** Button styling, spacing, dark mode

### Tab 2: Components (THE DESIGN SYSTEM)
Shows all design tokens:

```
┌──────────────────────────────────────────┐
│  COLORS                                  │
│  ┌────────┐ Background                   │
│  │        │ Secondary Background         │
│  │ Accent │ Text, Text Secondary         │
│  │ Green  │ Success Indicator           │
│  │ Orange │ Warning                      │
│  │ Red    │ Error                        │
└──────────────────────────────────────────┘

┌──────────────────────────────────────────┐
│  TYPOGRAPHY                              │
│  Display Large (32pt Bold)               │
│  Heading Large (24pt Semibold)          │
│  Body Medium (15pt Regular)              │
│  Caption (11pt Regular)                  │
└──────────────────────────────────────────┘

┌──────────────────────────────────────────┐
│  BUTTONS                                 │
│  ┌─────────────────────────────────────┐ │
│  │   Primary Button (48pt height)      │ │
│  └─────────────────────────────────────┘ │
│  ┌─────────────────────────────────────┐ │
│  │ Secondary Button (outline)          │ │
│  └─────────────────────────────────────┘ │
│  ┌─────────────────────────────────────┐ │
│  │  Disabled Button (gray)             │ │
│  └─────────────────────────────────────┘ │
└──────────────────────────────────────────┘

┌──────────────────────────────────────────┐
│  CARDS & CONTAINERS                      │
│  ┌──────────────────────────────────────┐│
│  │ Card Title                            ││
│  │ This is a card component with        ││
│  │ content inside. It has padding,      ││
│  │ border, and corner radius.           ││
│  └──────────────────────────────────────┘│
│                                          │
│        User Message →      ┌──────────┐ │
│                            │ Hi there │ │
│                            └──────────┘ │
│  ┌──────────────┐                      │
│  │ Hello! I'm   │ ← Assistant Message  │
│  │ here to help │                      │
│  └──────────────┘                      │
└──────────────────────────────────────────┘
```

### Tab 3: Design System Info
- View all tokens in a structured list
- See spacing grid values
- Review typography scale

### Tab 4: Settings
- Sample settings screen layout
- Dark mode toggle
- App version info

---

## How to Verify The Design

As soon as the app builds, check:

### ✅ Color Verification

**Light Mode:**
```
Background:        White (#FFFFFF)
Text:             Black (#000000)
Accent:           iOS Blue (#007AFF)
Borders:          Light gray (#E5E5E5)
```

**Dark Mode (Toggle with button):**
```
Background:        Black (#000000)
Text:             White (#FFFFFF)
Accent:           iOS Blue (#007AFF)
Borders:          Dark gray (#404040)
```

**Action:** Tap the dark mode toggle button to verify both themes

### ✅ Typography Verification

In the Components tab, you should see:
- **Display Large** - Biggest, boldest (32pt)
- **Heading Large** - Section headers (24pt)
- **Body Medium** - Regular text (15pt)
- **Caption** - Smallest text (11pt)

**Action:** Text should scale smoothly when you increase system text size in Settings

### ✅ Spacing Verification

Measure with your finger or eye:
- Small gaps between elements = 8pt spacing
- Padding around content = 16pt from edges
- Section gaps = 24pt vertical spacing

**Action:** All elements should feel well-organized and aligned

### ✅ Button Verification

- **Primary buttons** should be full-width, 48pt tall, blue background
- **Secondary buttons** should have outline style
- **Disabled buttons** should be grayed out

**Action:** Tap buttons to verify they respond and have proper press states

### ✅ Dark Mode Verification

- Toggle dark mode in Components tab
- **Verify:** All colors invert appropriately
- **Check:** Text is readable on dark background
- **Confirm:** Borders are still visible

**Action:** Switch between light and dark modes multiple times

---

## Build on Different Devices

### Simulator (Recommended for Quick Testing)

```bash
# Build and run on default simulator
xcodebuild -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'

# Or in Xcode: Select simulator → Product → Run
```

**Devices available:**
- iPhone 15 Pro (latest, best for testing)
- iPhone 14 (check older device compatibility)
- iPad (for future Phase 3)

### Physical iPhone (For Real Testing)

```bash
# Connect iPhone via USB
# Then in Xcode: Select device → Product → Run

# Or via CLI:
xcodebuild -scheme LocalAI \
  -destination 'generic/platform=iOS' \
  -allowProvisioningUpdates
```

**Advantages:**
- See actual device performance
- Test haptic feedback
- Check real display colors
- Test screen sizes (Pro Max, mini, etc.)

---

## Live Editing with Canvas Preview

Once the app builds:

1. Open `ContentView.swift`
2. Press `Cmd + Option + Return` to open Canvas
3. Click "Resume" to enable live preview
4. **Edit code → preview updates instantly**

Example: Change a color and see it update in real-time:

```swift
// Before
AppColors.accent  // Blue

// Change to
AppColors.error   // Red

// Canvas updates automatically without rebuilding!
```

---

## Troubleshooting Quick Fixes

| Issue | Fix |
|-------|-----|
| "No Xcode project found" | Create project: File → New → iOS App |
| "Simulator won't start" | `xcrun simctl erase all` then restart Xcode |
| "Build fails" | `xcodebuild clean` then try again |
| "Colors look wrong" | Make sure `UIConstants.swift` is in project |
| "Dark mode not working" | Add `.preferredColorScheme(nil)` to root view |
| "Preview won't show" | Click blue "Resume" button on Canvas |

---

## First Build Checklist

Before you start Phase 2 implementation:

- [ ] Xcode project created and opens without errors
- [ ] UIConstants.swift compiles without warnings
- [ ] ContentView builds successfully
- [ ] ComponentPreviewsView renders all colors
- [ ] Can toggle between light and dark modes
- [ ] All buttons are 48pt tall and clickable
- [ ] Text scales with system font size
- [ ] Simulator or device builds in under 30 seconds
- [ ] Canvas preview works for live editing
- [ ] Can see all 9 colors distinctly
- [ ] Typography hierarchy is clear (large → small)
- [ ] Card border is visible in both themes

---

## What Happens Next

Once the base build is working:

**Phase 2 Week 1-2:**
- Implement actual components (buttons, inputs, cards)
- Add animations
- Create component library
- Add unit tests

**Phase 2 Week 3:**
- Build screen layouts (Chat, Conversations, Documents)
- Add navigation between screens
- Implement real view models

**Phase 2 Week 4-5:**
- Connect data models
- Add persistence layer
- Integrate with services
- Full integration testing

Each step adds visible features you can test immediately.

---

## Key Files for Building

| File | Purpose | Status |
|------|---------|--------|
| `UIConstants.swift` | Design tokens | ✅ Ready |
| `LocalAIApp.swift` | App entry point | Create in Phase 2 |
| `ContentView.swift` | Root view with tabs | Create in Phase 2 |
| `ComponentPreviewsView.swift` | Design system preview | Create in Phase 2 |
| `*.xcodeproj` | Xcode project | Create in Phase 2 |

---

## Commands You'll Use Most

```bash
# Build and run
xcodebuild build -scheme LocalAI

# Clean + rebuild
xcodebuild clean -scheme LocalAI && xcodebuild build -scheme LocalAI

# Run tests
xcodebuild test -scheme LocalAI

# Check design token compilation
swiftc UIConstants.swift

# Format code
swiftlint --fix
```

---

## Summary

Building the app is a 3-step process:

1. **Create Xcode Project** (5 minutes)
   - File → New → iOS App
   - Configure for iOS 17+

2. **Add Code from Phase 2 Guide** (10 minutes)
   - Copy LocalAIApp.swift
   - Copy ContentView.swift
   - Copy ComponentPreviewsView.swift

3. **Build & Run** (Seconds)
   - Product → Run
   - See design system on screen
   - Toggle dark mode
   - Edit code → instant preview

**That's it. You're verifying the design live.**

---

**Ready to start Phase 2? Create that Xcode project! 🚀**


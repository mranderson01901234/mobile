# Phase 2: Xcode Project Setup & Preview System

**iOS Local AI Assistant**
**Version:** 1.0
**Purpose:** Build and verify the design system on actual devices

---

## Quick Start: Build & Preview

### Step 1: Create Xcode Project

```bash
# From /home/user/mobile directory
# Create a new iOS App project

# Option A: Using Xcode GUI (Recommended for first-time setup)
1. Open Xcode
2. File → New → Project
3. Choose "iOS" → "App"
4. Configure:
   - Product Name: LocalAI
   - Organization: LocalAI
   - Bundle Identifier: com.localai.mobile
   - Team: None (for now)
   - Language: Swift
   - Interface: SwiftUI
   - Include Tests: YES
5. Save to: /home/user/mobile

# Option B: Using Command Line
mkdir -p /home/user/mobile/LocalAI
cd /home/user/mobile
swift package init --type app --name LocalAI
```

### Step 2: Project Structure Setup

After creating the project, organize it as:

```
LocalAI.xcodeproj/
├── LocalAI/
│   ├── LocalAIApp.swift           (Entry point)
│   ├── ContentView.swift          (Root view - tab navigation)
│   ├── Assets.xcassets/           (Icons, images)
│   ├── App/
│   ├── Models/
│   ├── Services/
│   ├── ViewModels/
│   ├── Views/
│   │   ├── Chat/
│   │   ├── Components/
│   │   └── Screens/
│   ├── Utilities/
│   │   ├── Constants/
│   │   │   └── UIConstants.swift  (Already created ✓)
│   │   └── Helpers/
│   └── Resources/
│       └── Localization/
├── LocalAITests/
│   └── (Test files)
└── LocalAIUITests/
    └── (UI test files)
```

### Step 3: Create App Entry Point

Create `LocalAIApp.swift`:

```swift
//
//  LocalAIApp.swift
//  iOS Local AI Assistant
//
//  App entry point with window configuration
//

import SwiftUI

@main
struct LocalAIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(nil)  // Respect system dark mode
        }
    }
}
```

### Step 4: Build Settings Configuration

**In Xcode (Project Settings):**

1. **General Tab:**
   - Product Name: LocalAI
   - Bundle Identifier: com.localai.mobile
   - Minimum Deployments: iOS 17.0
   - Supported Platforms: iPhone
   - App Icon: (Leave default for now)
   - Launch Screen: Storyboard or SwiftUI

2. **Build Settings Tab:**
   - Swift Language Version: Swift 5.9
   - Optimization Level (Debug): None [-O0]
   - Optimization Level (Release): Fast, Whole Module Optimization [-Owholemodule]

3. **Build Phases:**
   - Compile Sources: All Swift files
   - Link Binary With Libraries: Foundation, SwiftUI, Combine, CoreML
   - Copy Bundle Resources: Assets, Localization files

4. **Run Script (Optional - for SwiftLint):**
   ```bash
   if which swiftlint >/dev/null; then
     swiftlint
   else
     echo "warning: SwiftLint not installed"
   fi
   ```

---

## Preview System Setup

### Create Preview Helper

Create `Utilities/Helpers/PreviewProvider.swift`:

```swift
//
//  PreviewProvider.swift
//  iOS Local AI Assistant
//
//  Preview environment setup for SwiftUI Canvas
//

import SwiftUI

// MARK: - Preview Container
struct PreviewContainer<Content: View>: View {
    let content: Content
    @State private var isDarkMode = false

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            AppColors.background
                .ignoresSafeArea()

            VStack(spacing: Spacing.md) {
                // Header with dark mode toggle
                HStack {
                    Text("Preview")
                        .font(.headingSmall)
                    Spacer()
                    Button(action: { isDarkMode.toggle() }) {
                        Image(systemName: isDarkMode ? "sun.max" : "moon")
                            .foregroundColor(AppColors.text)
                    }
                }
                .padding(Spacing.md)

                // Content
                content

                Spacer()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

// MARK: - Preview Extensions
#if DEBUG
extension View {
    func previewContainer() -> some View {
        PreviewContainer { self }
    }

    func previewBoth() -> some View {
        Group {
            self.preferredColorScheme(.light)
                .previewDisplayName("Light Mode")

            self.preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
#endif
```

### Create Component Previews

Create `Views/Components/ComponentPreviews.swift`:

```swift
//
//  ComponentPreviews.swift
//  iOS Local AI Assistant
//
//  Preview all components from design system
//

import SwiftUI

struct ComponentPreviewsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                // MARK: - Colors
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    Text("Colors")
                        .font(.headingLarge)

                    VStack(spacing: Spacing.sm) {
                        ColorRow(name: "Background", color: AppColors.background)
                        ColorRow(name: "Secondary BG", color: AppColors.secondaryBackground)
                        ColorRow(name: "Tertiary BG", color: AppColors.tertiaryBackground)
                        ColorRow(name: "Text", color: AppColors.text)
                        ColorRow(name: "Text Secondary", color: AppColors.textSecondary)
                        ColorRow(name: "Accent", color: AppColors.accent)
                        ColorRow(name: "Success", color: AppColors.success)
                        ColorRow(name: "Warning", color: AppColors.warning)
                        ColorRow(name: "Error", color: AppColors.error)
                    }
                }

                Divider()

                // MARK: - Typography
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    Text("Typography")
                        .font(.headingLarge)

                    Text("Display Large")
                        .font(.displayLarge)
                    Text("Heading Large")
                        .font(.headingLarge)
                    Text("Body Medium")
                        .font(.bodyMedium)
                    Text("Caption")
                        .font(.caption)
                }

                Divider()

                // MARK: - Buttons
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    Text("Buttons")
                        .font(.headingLarge)

                    PrimaryButtonPreview()
                    SecondaryButtonPreview()
                }

                Divider()

                // MARK: - Cards
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    Text("Cards & Containers")
                        .font(.headingLarge)

                    CardPreview()
                    MessageBubblePreview()
                }
            }
            .padding(Spacing.md)
        }
        .background(AppColors.background)
    }
}

// MARK: - Helper Views

struct ColorRow: View {
    let name: String
    let color: Color

    var body: some View {
        HStack(spacing: Spacing.md) {
            color
                .frame(width: 60, height: 60)
                .cornerRadius(CornerRadius.medium)
                .border(AppColors.border, width: 1)

            VStack(alignment: .leading) {
                Text(name)
                    .font(.bodyMedium)
                    .foregroundColor(AppColors.text)
            }

            Spacer()
        }
    }
}

struct PrimaryButtonPreview: View {
    var body: some View {
        VStack(spacing: Spacing.sm) {
            Button(action: {}) {
                Text("Primary Button")
                    .font(.bodyMedium)
                    .fontWeight(.semibold)
            }
            .frame(height: ComponentSize.buttonLarge)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(AppColors.accent)
            .cornerRadius(CornerRadius.large)

            Button(action: {}) {
                Text("Disabled Button")
                    .font(.bodyMedium)
                    .fontWeight(.semibold)
            }
            .frame(height: ComponentSize.buttonLarge)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(AppColors.textTertiary)
            .cornerRadius(CornerRadius.large)
            .disabled(true)
        }
    }
}

struct SecondaryButtonPreview: View {
    var body: some View {
        Button(action: {}) {
            Text("Secondary Button")
                .font(.bodyMedium)
                .fontWeight(.semibold)
                .foregroundColor(AppColors.accent)
        }
        .frame(height: ComponentSize.buttonLarge)
        .frame(maxWidth: .infinity)
        .background(AppColors.tertiaryBackground)
        .border(AppColors.border, width: 1)
        .cornerRadius(CornerRadius.large)
    }
}

struct CardPreview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            Text("Card Title")
                .font(.headingSmall)

            Text("This is a card component with content inside. It has padding, border, and corner radius.")
                .font(.bodySmall)
                .foregroundColor(AppColors.textSecondary)
        }
        .padding(Spacing.md)
        .background(AppColors.secondaryBackground)
        .border(AppColors.border, width: 1)
        .cornerRadius(CornerRadius.large)
    }
}

struct MessageBubblePreview: View {
    var body: some View {
        VStack(spacing: Spacing.md) {
            // User message
            HStack(alignment: .bottom, spacing: Spacing.sm) {
                Spacer()

                VStack(alignment: .trailing, spacing: Spacing.xs) {
                    Text("This is a user message")
                        .font(.bodyMedium)
                        .foregroundColor(.white)

                    Text("2:45 PM")
                        .font(.caption)
                        .foregroundColor(Color.white.opacity(0.7))
                }
                .padding(.horizontal, Spacing.md)
                .padding(.vertical, Spacing.sm)
                .background(AppColors.accent)
                .cornerRadius(CornerRadius.extraLarge)
            }

            // Assistant message
            HStack(alignment: .bottom, spacing: Spacing.sm) {
                VStack(alignment: .leading, spacing: Spacing.xs) {
                    Text("This is an assistant response")
                        .font(.bodyMedium)
                        .foregroundColor(AppColors.text)

                    Text("2:46 PM")
                        .font(.caption)
                        .foregroundColor(AppColors.textSecondary)
                }
                .padding(.horizontal, Spacing.md)
                .padding(.vertical, Spacing.sm)
                .background(AppColors.tertiaryBackground)
                .cornerRadius(CornerRadius.extraLarge)

                Spacer()
            }
        }
        .padding(Spacing.md)
    }
}

#if DEBUG
struct ComponentPreviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentPreviewsView()
            .previewBoth()
    }
}
#endif
```

### Update ContentView for Preview

Create `ContentView.swift`:

```swift
//
//  ContentView.swift
//  iOS Local AI Assistant
//
//  Root view with tab navigation and preview system
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            // MARK: - Chat Tab
            ChatViewPreview()
                .tabItem {
                    Label("Chat", systemImage: "bubble.left.fill")
                }
                .tag(0)

            // MARK: - Components Preview
            ComponentPreviewsView()
                .tabItem {
                    Label("Components", systemImage: "square.grid.2x2")
                }
                .tag(1)

            // MARK: - Design System
            DesignSystemPreview()
                .tabItem {
                    Label("Design", systemImage: "paintpalette.fill")
                }
                .tag(2)

            // MARK: - Settings
            SettingsViewPreview()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
        }
        .preferredColorScheme(nil)
    }
}

// MARK: - Preview Views (Placeholder for Phase 2)

struct ChatViewPreview: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Chat Screen")
                    .font(.headingLarge)
                    .padding(Spacing.md)

                Spacer()

                HStack(spacing: Spacing.sm) {
                    TextField("Type a message...", text: .constant(""))
                        .font(.bodyMedium)
                        .padding(.horizontal, Spacing.md)
                        .padding(.vertical, Spacing.sm)
                        .background(AppColors.secondaryBackground)
                        .border(AppColors.border, width: 1)
                        .cornerRadius(CornerRadius.large)
                        .frame(height: 44)

                    Button(action: {}) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(AppColors.accent)
                    }
                }
                .padding(Spacing.md)
            }
            .background(AppColors.background)
            .navigationTitle("Chat")
        }
    }
}

struct DesignSystemPreview: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Colors") {
                    HStack {
                        Circle()
                            .fill(AppColors.accent)
                            .frame(width: 40, height: 40)
                        Text("Accent")
                    }

                    HStack {
                        Circle()
                            .fill(AppColors.success)
                            .frame(width: 40, height: 40)
                        Text("Success")
                    }

                    HStack {
                        Circle()
                            .fill(AppColors.error)
                            .frame(width: 40, height: 40)
                        Text("Error")
                    }
                }

                Section("Typography") {
                    Text("Display Large").font(.displayLarge)
                    Text("Body Medium").font(.bodyMedium)
                    Text("Caption").font(.caption)
                }

                Section("Spacing") {
                    Text("Spacing values defined in 8pt grid")
                        .font(.bodySmall)
                }
            }
            .navigationTitle("Design System")
        }
    }
}

struct SettingsViewPreview: View {
    var body: some View {
        NavigationStack {
            List {
                Section("App Info") {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(AppColors.textSecondary)
                    }

                    HStack {
                        Text("Build")
                        Spacer()
                        Text("1")
                            .foregroundColor(AppColors.textSecondary)
                    }
                }

                Section("Preferences") {
                    Toggle("Dark Mode", isOn: .constant(false))
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")

            ContentView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
#endif
```

---

## Building & Running on Device

### Option 1: Build on Simulator

```bash
# List available simulators
xcrun simctl list devices

# Build and run on default simulator
xcodebuild -scheme LocalAI \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro' \
  -derivedDataPath .build

# Or from Xcode:
# 1. Product → Scheme → LocalAI
# 2. Select "iPhone 15 Pro" simulator at top
# 3. Product → Run (or press Cmd+R)
```

### Option 2: Build on Physical Device

```bash
# 1. Connect iPhone via USB
# 2. Trust the device in Xcode

# In Xcode:
# 1. Window → Devices and Simulators
# 2. Verify device is connected
# 3. Select device at top
# 4. Product → Run

# Or via command line:
xcodebuild -scheme LocalAI \
  -configuration Debug \
  -destination 'generic/platform=iOS' \
  -allowProvisioningUpdates
```

---

## Live Preview During Development

### Enable SwiftUI Previews

In any SwiftUI view, add:

```swift
#if DEBUG
struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MyView()
                .preferredColorScheme(.light)
                .previewDisplayName("Light")

            MyView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark")
        }
    }
}
#endif
```

### Using Xcode Canvas

1. Open any SwiftUI file
2. Editor → Canvas (or press Cmd+Option+Return)
3. Click "Resume" to see live preview
4. Changes to code update preview instantly
5. Click play button to run on simulator

### Tips for Live Previewing

- **Hot Reload:** Changes save and preview updates automatically
- **Device Rotation:** Use preview device selector to test orientations
- **Dynamic Type:** Add `.dynamicTypeSize(.xLarge)` to test text scaling
- **Accessibility:** Use `.preferredColorScheme()` to test dark mode

---

## Verification Checklist

As you build Phase 2, verify:

### Colors ✓
- [ ] Light mode background is white (#FFF)
- [ ] Dark mode background is black (#000)
- [ ] Text colors have proper contrast (4.5:1 minimum)
- [ ] Accent color is iOS blue (#007AFF)
- [ ] Borders are visible in both modes

### Typography ✓
- [ ] Display text is bold and readable
- [ ] Body text is 15-16pt
- [ ] Captions are 11pt
- [ ] All text respects Dynamic Type (text scaling)

### Spacing ✓
- [ ] Components follow 8pt grid
- [ ] Padding is 16pt (Spacing.md)
- [ ] Section gaps are 24pt (Spacing.lg)
- [ ] Touch targets are 44×44pt minimum

### Components ✓
- [ ] Buttons are 48pt high
- [ ] Input fields are 44pt high
- [ ] Card corners are 12pt
- [ ] Message bubbles are rounded (16pt)

### Dark Mode ✓
- [ ] All colors adapt automatically
- [ ] Text is readable in both modes
- [ ] Borders are visible
- [ ] Accents work in both modes

### Accessibility ✓
- [ ] VoiceOver reads elements correctly
- [ ] Button sizes are ≥44×44pt
- [ ] Text can scale to 200% with Dynamic Type
- [ ] No color-only information

---

## Build Commands Reference

```bash
# Clean build
xcodebuild clean -scheme LocalAI

# Debug build (development)
xcodebuild build \
  -scheme LocalAI \
  -configuration Debug

# Release build (optimized)
xcodebuild build \
  -scheme LocalAI \
  -configuration Release

# Run tests
xcodebuild test -scheme LocalAI

# Build + Run on device
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'generic/platform=iOS' \
  -allowProvisioningUpdates

# Generate code coverage
xcodebuild test \
  -scheme LocalAI \
  -configuration Debug \
  -enableCodeCoverage YES \
  -derivedDataPath .build

# Show build log
xcodebuild -scheme LocalAI \
  -showBuildSettings -json
```

---

## Troubleshooting Build Issues

### Issue: "Xcode project not found"
```bash
# Check if .xcodeproj exists
ls -la *.xcodeproj

# If not, create new project from Xcode GUI
# Or manually create Package.swift for SPM project
```

### Issue: "Command line tools not found"
```bash
xcode-select --install
# or
sudo xcode-select --reset
```

### Issue: "Device not authorized"
```bash
# Reconnect device and trust in Xcode
# Window → Devices and Simulators
# Unpair and repair device
```

### Issue: "Build fails with signing errors"
```bash
# Disable automatic signing for now
# In Xcode: Project Settings → Signing & Capabilities
# Team: None
```

---

## Next: Phase 2 Build Plan

Once Xcode is set up:

1. **Week 1:** Build component library with previews
2. **Week 2:** Implement screen layouts with design system
3. **Week 3:** Add data models and view models
4. **Week 4:** Integrate state management
5. **Week 5:** Add tests and polish

Each component gets immediate visual feedback through:
- SwiftUI Canvas previews (instant)
- Simulator builds (seconds)
- Physical device testing (minutes)

---

**Ready to build? Let's start with the component library in Phase 2!**


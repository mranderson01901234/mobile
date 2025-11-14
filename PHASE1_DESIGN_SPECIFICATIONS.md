# Phase 1: Design Specifications
## iOS Local AI Assistant - Complete Design System & UI Standards

**Version:** 1.0
**Phase:** 1 - Design
**Status:** Active Development
**Last Updated:** 2025-11-14

---

## Table of Contents

1. [Design System Overview](#design-system-overview)
2. [Color System](#color-system)
3. [Typography](#typography)
4. [Spacing & Layout](#spacing--layout)
5. [Component Library](#component-library)
6. [Screen Specifications](#screen-specifications)
7. [Interaction Patterns](#interaction-patterns)
8. [Accessibility Requirements](#accessibility-requirements)
9. [Localization Strategy](#localization-strategy)
10. [Animation & Motion](#animation--motion)

---

## Design System Overview

### Design Philosophy

The design follows **"Clarity & Efficiency"** principles:

| Principle | Definition | Application |
|-----------|-----------|-------------|
| **Clarity** | Information hierarchy that guides user attention | Clear visual hierarchy, consistent spacing, readable typography |
| **Efficiency** | Minimal taps to achieve goals | Bottom tab navigation, quick access to chat |
| **Accessibility** | Inclusive for all users | WCAG 2.1 AA compliance, VoiceOver support |
| **Privacy Focus** | Privacy-first visual language | No tracking indicators, local-only messaging |

### Design Tokens

All design decisions centralized in Swift constants:

```swift
// Location: Utilities/Constants/DesignTokens.swift
struct DesignTokens {
    struct Colors { }
    struct Typography { }
    struct Spacing { }
    struct Shadows { }
    struct Animations { }
    struct Radius { }
}
```

---

## Color System

### Semantic Color Palette

The app uses a **neutral monochromatic palette with accent colors**.

#### Primary Colors

```swift
enum AppColors {
    // Backgrounds
    static let background = Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(hex: "#000000") // Pure black for dark mode
        } else {
            return UIColor(hex: "#FFFFFF") // Pure white for light mode
        }
    })

    static let secondaryBackground = Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(hex: "#1A1A1A")
        } else {
            return UIColor(hex: "#F9F9F9")
        }
    })

    static let tertiaryBackground = Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(hex: "#2D2D2D")
        } else {
            return UIColor(hex: "#F0F0F0")
        }
    })

    // Text
    static let text = Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(hex: "#FFFFFF")
        } else {
            return UIColor(hex: "#000000")
        }
    })

    static let textSecondary = Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(hex: "#A0A0A0")
        } else {
            return UIColor(hex: "#666666")
        }
    })

    static let textTertiary = Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(hex: "#707070")
        } else {
            return UIColor(hex: "#999999")
        }
    })

    // Borders & Dividers
    static let border = Color(UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(hex: "#404040")
        } else {
            return UIColor(hex: "#E5E5E5")
        }
    })

    // Accent
    static let accent = Color(hex: "#007AFF") // iOS Blue
    static let accentLight = Color(hex: "#34C759") // iOS Green (success)
    static let warning = Color(hex: "#FF9500") // iOS Orange
    static let error = Color(hex: "#FF3B30") // iOS Red
}
```

#### Color Usage Guidelines

| Color | Usage | Example |
|-------|-------|---------|
| **Primary Text** | Headlines, body text | Chat messages, labels |
| **Secondary Text** | Metadata, timestamps | "2 hours ago", helper text |
| **Accent** | Interactive elements, highlights | Buttons, selection state |
| **Success** | Positive actions | Message sent, model loaded |
| **Warning** | Caution states | Long-running inference |
| **Error** | Critical issues | Failed upload, error messages |
| **Border** | Dividers, separators | Card borders, input fields |

### Dark Mode Support

All colors implement `UIColor(traitCollection:)` for automatic dark mode:

```swift
// Automatic dark mode in SwiftUI
@Environment(\.colorScheme) var colorScheme

var body: some View {
    ZStack {
        AppColors.background
            .ignoresSafeArea()

        VStack {
            Text("Hello")
                .foregroundColor(AppColors.text)
        }
    }
    .preferredColorScheme(nil) // Respect system setting
}
```

---

## Typography

### Font Family

```swift
// Native iOS fonts (no custom fonts required)
// San Francisco system font is default
let systemFont = Font.system(size: 16, weight: .regular, design: .default)
```

### Type Scale

```swift
enum Typography {
    // Display (Large headlines)
    static let displayLarge = Font.system(size: 32, weight: .bold)
    static let displaySmall = Font.system(size: 28, weight: .bold)

    // Heading (Section titles)
    static let headingLarge = Font.system(size: 24, weight: .semibold)
    static let headingMedium = Font.system(size: 20, weight: .semibold)
    static let headingSmall = Font.system(size: 18, weight: .semibold)

    // Body (Main content)
    static let bodyLarge = Font.system(size: 16, weight: .regular)
    static let bodyMedium = Font.system(size: 15, weight: .regular)
    static let bodySmall = Font.system(size: 14, weight: .regular)

    // Label (Metadata, UI text)
    static let labelLarge = Font.system(size: 13, weight: .semibold)
    static let labelMedium = Font.system(size: 12, weight: .semibold)
    static let labelSmall = Font.system(size: 11, weight: .semibold)

    // Caption (Smallest text)
    static let caption = Font.system(size: 11, weight: .regular)
}
```

### Text Style Usage

| Style | Size | Weight | Use Case | Example |
|-------|------|--------|----------|---------|
| **Display Large** | 32pt | Bold | App name, onboarding headline | "Your AI Assistant" |
| **Heading Large** | 24pt | Semibold | Screen titles | "Chat", "Documents" |
| **Heading Medium** | 20pt | Semibold | Section headers | "Recent Conversations" |
| **Body Large** | 16pt | Regular | Primary content | Chat messages, descriptions |
| **Body Medium** | 15pt | Regular | UI text, buttons | Button labels |
| **Label Large** | 13pt | Semibold | Metadata, tags | "2 hours ago", tags |
| **Caption** | 11pt | Regular | Helper text, hints | "Type a message...", errors |

### Accessibility Adjustments

Support Dynamic Type for larger text sizes:

```swift
Text("Hello")
    .font(.system(.body, design: .default))
    .lineLimit(nil) // Allow wrapping
    .minimumScaleFactor(0.8) // Minimum readable size
```

---

## Spacing & Layout

### Spacing Scale

```swift
enum Spacing {
    static let xs2 = CGFloat(4)
    static let xs = CGFloat(8)
    static let sm = CGFloat(12)
    static let md = CGFloat(16)
    static let lg = CGFloat(24)
    static let xl = CGFloat(32)
    static let xl2 = CGFloat(48)
    static let xl3 = CGFloat(64)

    // Common combinations
    static let screenPadding = md           // 16pt
    static let componentPadding = sm       // 12pt
    static let interComponentGap = lg      // 24pt
}
```

### Layout Grid

- **8pt grid system** for alignment precision
- **16pt screen margins** (top, bottom, leading, trailing)
- **12pt internal component padding** for consistency
- **24pt spacing between major sections**

### Safe Area Usage

```swift
VStack(spacing: Spacing.lg) {
    // Header
    HStack {
        Text("Chat")
            .font(.headingLarge)
            .padding(.horizontal, Spacing.md)
    }

    // Content
    ChatListView()
        .padding(.horizontal, Spacing.md)

    // Footer (respects keyboard)
    InputBar()
        .padding(.horizontal, Spacing.md)
}
.ignoresSafeArea(.keyboard, edges: .bottom)
```

### Device-Specific Adaptations

```swift
// Regular (iPhone)
@Environment(\.horizontalSizeClass) var sizeClass

var contentPadding: CGFloat {
    sizeClass == .compact ? Spacing.md : Spacing.lg
}
```

---

## Component Library

### 1. Primary Button

**Purpose:** Call-to-action buttons

**States:**
```swift
struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var isLoading: Bool = false
    var isDisabled: Bool = false

    var body: some View {
        Button(action: action) {
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(height: 20)
            } else {
                Text(title)
                    .font(.bodyMedium)
                    .fontWeight(.semibold)
            }
        }
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(
            isDisabled ? AppColors.textTertiary : AppColors.accent
        )
        .cornerRadius(12)
        .disabled(isDisabled || isLoading)
    }
}
```

**Specifications:**
- Height: 48pt (tap target minimum 44pt)
- Width: Full width by default
- Corner radius: 12pt
- States: Normal, Pressed, Loading, Disabled
- Minimum tap target: 44×44pt (WCAG 2.1 AAA)

**Usage:**
```swift
PrimaryButton(
    title: "Send Message",
    action: { /* send */ },
    isLoading: viewModel.isSending
)
```

### 2. Secondary Button

**Purpose:** Alternative actions, less emphasis

```swift
struct SecondaryButton: View {
    let title: String
    let action: () -> Void
    var isDisabled: Bool = false

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.bodyMedium)
                .fontWeight(.semibold)
        }
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .foregroundColor(AppColors.accent)
        .background(AppColors.tertiaryBackground)
        .border(AppColors.border, width: 1)
        .cornerRadius(12)
        .disabled(isDisabled)
    }
}
```

### 3. Card

**Purpose:** Content containers

```swift
struct Card<Content: View>: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            content()
        }
        .padding(Spacing.md)
        .background(AppColors.secondaryBackground)
        .border(AppColors.border, width: 1)
        .cornerRadius(12)
    }
}
```

**Specifications:**
- Background: Secondary background
- Border: 1pt, secondary border color
- Corner radius: 12pt
- Padding: 16pt internal
- Shadow: Light shadow for depth (optional)

### 4. Message Bubble

**Purpose:** Chat message display

```swift
struct MessageBubble: View {
    let message: Message
    let isCurrentUser: Bool

    var body: some View {
        HStack(alignment: .bottom, spacing: Spacing.sm) {
            if isCurrentUser {
                Spacer()
            }

            VStack(alignment: isCurrentUser ? .trailing : .leading, spacing: Spacing.xs) {
                Text(message.content)
                    .font(.bodyMedium)
                    .foregroundColor(isCurrentUser ? .white : AppColors.text)
                    .lineLimit(nil)

                Text(message.timestamp.formatted(date: .omitted, time: .shortened))
                    .font(.caption)
                    .foregroundColor(
                        isCurrentUser ?
                        Color.white.opacity(0.7) :
                        AppColors.textSecondary
                    )
            }
            .padding(.horizontal, Spacing.md)
            .padding(.vertical, Spacing.sm)
            .background(
                isCurrentUser ?
                AppColors.accent :
                AppColors.tertiaryBackground
            )
            .cornerRadius(16)
            .frame(maxWidth: 300, alignment:
                isCurrentUser ? .trailing : .leading)

            if !isCurrentUser {
                Spacer()
            }
        }
        .padding(.horizontal, Spacing.md)
    }
}
```

**Specifications:**
- User message: Accent background, white text
- Assistant message: Tertiary background, primary text
- Max width: 300pt (2/3 screen on iPhone)
- Corner radius: 16pt
- Padding: 12pt horizontal, 8pt vertical

### 5. Input Field

**Purpose:** Text input for chat

```swift
struct ChatInputField: View {
    @Binding var text: String
    var placeholder: String = "Type a message..."
    var onSubmit: () -> Void = {}

    var body: some View {
        HStack(spacing: Spacing.sm) {
            TextField(placeholder, text: $text)
                .font(.bodyMedium)
                .padding(.horizontal, Spacing.md)
                .padding(.vertical, Spacing.sm)
                .background(AppColors.secondaryBackground)
                .border(AppColors.border, width: 1)
                .cornerRadius(12)
                .frame(height: 44)

            Button(action: onSubmit) {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(
                        text.isEmpty ? AppColors.textTertiary : AppColors.accent
                    )
            }
            .disabled(text.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding(Spacing.md)
        .background(AppColors.background)
    }
}
```

**Specifications:**
- Height: 44pt input field
- Background: Secondary background
- Border: 1pt secondary border
- Corner radius: 12pt
- Keyboard: Default keyboard
- Send button: Disabled when empty

### 6. Loading Indicator

**Purpose:** Feedback during operations

```swift
struct LoadingView: View {
    let message: String = "Processing..."

    var body: some View {
        VStack(spacing: Spacing.md) {
            ProgressView()
                .scaleEffect(1.2, anchor: .center)

            Text(message)
                .font(.bodyMedium)
                .foregroundColor(AppColors.textSecondary)
        }
        .padding(Spacing.lg)
        .background(AppColors.secondaryBackground)
        .cornerRadius(16)
    }
}
```

### 7. Error Alert

**Purpose:** Display error messages

```swift
struct ErrorBanner: View {
    let message: String
    let action: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundColor(AppColors.error)

                Text(message)
                    .font(.bodySmall)
                    .foregroundColor(AppColors.text)

                Spacer()
            }

            if let action = action {
                Button(action: action) {
                    Text("Retry")
                        .font(.labelMedium)
                        .foregroundColor(AppColors.accent)
                }
            }
        }
        .padding(Spacing.md)
        .background(AppColors.error.opacity(0.1))
        .border(AppColors.error, width: 1)
        .cornerRadius(8)
    }
}
```

### 8. Badge / Tag

**Purpose:** Metadata labels

```swift
struct Badge: View {
    let label: String
    let style: BadgeStyle = .default

    enum BadgeStyle {
        case `default`
        case accent
        case success
        case warning
    }

    var backgroundColor: Color {
        switch style {
        case .default: return AppColors.tertiaryBackground
        case .accent: return AppColors.accent.opacity(0.2)
        case .success: return AppColors.accentLight.opacity(0.2)
        case .warning: return AppColors.warning.opacity(0.2)
        }
    }

    var foregroundColor: Color {
        switch style {
        case .default: return AppColors.text
        case .accent: return AppColors.accent
        case .success: return AppColors.accentLight
        case .warning: return AppColors.warning
        }
    }

    var body: some View {
        Text(label)
            .font(.labelSmall)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, Spacing.sm)
            .padding(.vertical, Spacing.xs2)
            .background(backgroundColor)
            .cornerRadius(6)
    }
}
```

---

## Screen Specifications

### 1. Onboarding / Welcome

**Purpose:** First-run setup and app introduction

**Wireframe:**
```
┌─────────────────────────────┐
│                             │
│    ⬛ AI Assistant Logo     │
│                             │
│  "Your AI that keeps       │
│   secrets"                  │
│                             │
│  [Get Started Button]       │
│                             │
└─────────────────────────────┘
```

**Content:**
- App logo/branding
- Tagline: "Your AI that keeps secrets"
- Privacy statement
- "Get Started" button → Chat screen

**Interactions:**
- Single tap on "Get Started"
- No authentication required
- Can skip directly to chat

### 2. Chat Screen (Main)

**Purpose:** Primary user interface for conversations

**Layout:**
```
┌─────────────────────────────┐ ← Header (24pt)
│ ← | Chat | ⋯                │
├─────────────────────────────┤
│                             │
│  [Today]                    │
│                             │
│      📌 "Hello!"            │
│  Response bubble here       │
│                             │
│      💬 "Next message"      │
│  Assistant response         │
│                             │
│ ↓ (scroll down for more)    │
│                             │
├─────────────────────────────┤ ← Input area (56pt)
│  [Text field] [Send btn]    │
├─────────────────────────────┤
```

**Components:**
- Header: Back button, title, menu
- Message list: Scrollable, date separators
- Input field: Text + send button
- Bottom safe area: Keyboard space

**States:**
- Empty state: "Start a conversation"
- Loading: "Thinking..." indicator
- Error: Error banner with retry
- Typing indicator: Animated dots

### 3. Conversation List

**Purpose:** View and manage multiple conversations

**Layout:**
```
┌─────────────────────────────┐
│ Conversations | ⚙️ Settings │
├─────────────────────────────┤
│ ⊕ New Conversation          │
├─────────────────────────────┤
│                             │
│ 🤖 Today, 2:45 PM           │
│ "What is quantum..."        │ ← Last message preview
│ 12 messages                 │
│                             │
│ 🤖 Yesterday                │
│ "How to learn Python"       │
│ 5 messages                  │
│                             │
│ 🤖 Last Week               │
│ "Travel recommendations"    │
│ 23 messages                 │
│                             │
└─────────────────────────────┘
```

**Components:**
- Create new conversation button
- Conversation cards with:
  - Last message preview
  - Message count
  - Timestamp
  - Swipe to delete

**Interactions:**
- Tap to enter conversation
- Swipe left for delete option
- Grouping by date (Today, Yesterday, Older)

### 4. Document Library

**Purpose:** Manage uploaded documents

**Layout:**
```
┌─────────────────────────────┐
│ Documents | ⊕               │
├─────────────────────────────┤
│                             │
│ 📄 Research Paper           │
│ PDF • 2.4 MB • 12 pages    │
│ "Introduction to ML..."     │
│                             │
│ 🖼️ Chart Image             │
│ PNG • 450 KB                │
│                             │
│ 📰 Article                 │
│ PDF • 1.1 MB • 3 pages     │
│                             │
└─────────────────────────────┘
```

**Components:**
- Document cards with:
  - File type icon
  - Name
  - File size
  - File type and page count
  - Preview thumbnail
- Add button (floating or header)

**Interactions:**
- Tap to view details/share
- Swipe to delete
- Long press for preview

### 5. Settings

**Purpose:** Configure app behavior

**Layout:**
```
┌─────────────────────────────┐
│ Settings                    │
├─────────────────────────────┤
│                             │
│ 🎨 Display                  │
│ ├─ Theme: Auto (System)     │
│ └─ Text Size: Normal        │
│                             │
│ 🧠 AI Model                │
│ ├─ Current: Balanced        │
│ └─ [Change Model]           │
│                             │
│ 🔒 Privacy & Security       │
│ ├─ Require Authentication   │
│ ├─ Data Encryption          │
│ └─ Clear All Data           │
│                             │
│ ℹ️ About                    │
│ ├─ Version: 1.0.0           │
│ ├─ Build: 1                 │
│ └─ Privacy Policy           │
│                             │
└─────────────────────────────┘
```

**Components:**
- Settings sections
- Toggle switches
- Selection menus
- Action buttons

**Functionality:**
- Theme selection (Light/Dark/Auto)
- Text size adjustment
- Model selection
- Biometric auth toggle
- Data deletion
- App info

### 6. Model Selection

**Purpose:** Choose AI model

**Layout:**
```
┌─────────────────────────────┐
│ Choose Model                │
├─────────────────────────────┤
│                             │
│ ○ Fast                      │
│   "Quick responses"         │
│   ⚡ ~1s per response      │
│   💾 200MB                  │
│                             │
│ ● Balanced (Selected)       │
│   "Best overall"            │
│   ⚡ ~3s per response      │
│   💾 500MB                  │
│                             │
│ ○ Advanced                  │
│   "Most capable"            │
│   ⚡ ~7s per response      │
│   💾 1.2GB                  │
│                             │
│ [Done]                      │
│                             │
└─────────────────────────────┘
```

**Components:**
- Radio button selections
- Model descriptions
- Performance metrics
- Storage requirements
- Save button

---

## Interaction Patterns

### 1. Sending a Message

**Flow:**
```
User taps input field
  ↓
Cursor appears (keyboard shows)
  ↓
User types message
  ↓
Send button becomes active (blue)
  ↓
User taps send button OR presses return
  ↓
Message appears in chat (optimistic update)
  ↓
Inference begins (loading indicator under message)
  ↓
Response appears as it streams in
  ↓
Both messages saved to database
```

**Animations:**
- Message appears with slight scale-up
- Typing stops → send button pulses
- Response bubbles appear as tokens received

### 2. Document Upload

**Flow:**
```
User taps "+" button
  ↓
Action sheet appears:
  - Take Photo
  - Choose Photo
  - Upload PDF
  ↓
File picker / camera opens
  ↓
User selects document
  ↓
Preview shown
  ↓
User confirms upload
  ↓
Loading indicator starts
  ↓
Document processed:
  - Text extracted
  - Embeddings generated
  - Index created
  ↓
"Document added" confirmation
  ↓
Document appears in library
```

**Loading Indicators:**
- Circular progress showing % complete
- Estimated time remaining
- "Extracting text..." → "Generating embeddings..." → "Done"

### 3. Error Recovery

**Pattern:**
```
Operation fails
  ↓
Error banner appears (non-dismissive)
  ↓
User sees error message + icon
  ↓
User taps "Retry" button
  ↓
Operation reattempts
  ↓
Success or new error
```

**Error Examples:**
- "Unable to generate response. Retry?"
- "Document upload failed. Check file size."
- "Model not loaded. Please try again."

### 4. Navigation

**Tab Navigation:**
- Always visible at bottom
- 4 main sections: Chat | Documents | Settings | Help
- Current tab highlighted
- Badge for unread items (if applicable)

**Navigation Stack:**
- Modal: Settings, Add Document, Model Selection
- Push: Chat details, Document details
- Dismiss: Back button or swipe

### 5. Pull-to-Refresh

**Pattern:**
```
User pulls down on conversation list
  ↓
Refresh indicator appears
  ↓
List updates (loads recent conversations)
  ↓
Indicator disappears
```

**Constraints:**
- Only on list screens (not chat)
- Disabled during operations
- Haptic feedback on refresh

---

## Accessibility Requirements

### Vision

**Color Contrast (WCAG 2.1 AA):**
- Text: 4.5:1 minimum contrast
- Large text (18pt+): 3:1 minimum
- UI components: 3:1 minimum

**Text Scaling:**
- Support Dynamic Type (100% - 200%)
- No fixed heights for text
- Lines limit at least 3 lines for body text

**VoiceOver:**
```swift
Text("Message sent")
    .accessibilityLabel("Message sent successfully")
    .accessibilityHint("Double tap to edit")

Button(action: { }) {
    Image(systemName: "paperplane.fill")
        .accessibilityLabel("Send message")
}
```

### Motor

**Tap Target Size:**
- Minimum 44×44pt per WCAG 2.1 AAA
- Buttons: 48×48pt for primary actions
- Spacing between targets: 8pt minimum

**Gestures:**
- Support standard gestures (tap, double-tap, long-press)
- Provide button alternatives to swipe actions
- No time-limited interactions

### Cognitive

**Clear Language:**
- Simple, direct instructions
- Avoid jargon
- Provide help text
- Confirm destructive actions

### Hearing

**Sound:**
- Don't rely on sound alone for feedback
- Provide visual feedback for all audio events
- Support haptic feedback as primary indicator

### Example: Accessible Button

```swift
struct AccessiblePrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.bodyMedium)
                .fontWeight(.semibold)
                .lineLimit(nil)
                .minimumScaleFactor(0.8)
        }
        .frame(height: 48)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .background(AppColors.accent)
        .cornerRadius(12)
        .accessibilityLabel(title)
        .accessibilityHint("Double tap to confirm")
    }
}
```

---

## Localization Strategy

### Supported Languages (Phase 1)

1. **English (US)** - Primary
2. **English (GB)** - Secondary
3. **Spanish** - Optional for launch

### Localization Architecture

**Location:** `Resources/Localization/`

```
Localization/
├── en.lproj/
│   ├── Localizable.strings
│   └── InfoPlist.strings
├── es.lproj/
│   ├── Localizable.strings
│   └── InfoPlist.strings
└── LocalizationConstants.swift
```

### String Management

```swift
// Location: Utilities/Localization/LocalizationConstants.swift
enum Strings {
    enum Chat {
        static let title = NSLocalizedString(
            "chat_title",
            value: "Chat",
            comment: "Main chat screen title"
        )
        static let placeholder = NSLocalizedString(
            "chat_input_placeholder",
            value: "Type a message...",
            comment: "Chat input field placeholder"
        )
        static let sendButton = NSLocalizedString(
            "chat_send_button",
            value: "Send",
            comment: "Send message button label"
        )
    }

    enum Error {
        static let networkError = NSLocalizedString(
            "error_network",
            value: "Network connection error",
            comment: "Generic network error"
        )
        static let tryAgain = NSLocalizedString(
            "error_try_again",
            value: "Try Again",
            comment: "Retry button label"
        )
    }
}
```

### Usage

```swift
Text(Strings.Chat.title)
Button(action: send) {
    Text(Strings.Chat.sendButton)
}
```

### Number Formatting

```swift
let formatter = NumberFormatter()
formatter.locale = Locale.current
formatter.numberStyle = .decimal

Text("Memory: \(String(format: "%.1f", memoryUsage))MB")
```

### Date Formatting

```swift
@Environment(\.locale) var locale

var timestamp: String {
    let formatter = DateFormatter()
    formatter.locale = locale
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter.string(from: date)
}
```

---

## Animation & Motion

### Animation Principles

- **Purposeful:** Every animation serves a function
- **Responsive:** Instant feedback to user actions
- **Smooth:** 60 FPS (120 FPS on ProMotion devices)
- **Subtle:** Animations shouldn't distract

### Animation Library

```swift
enum AppAnimations {
    static let quick = Animation.easeInOut(duration: 0.2)
    static let standard = Animation.easeInOut(duration: 0.3)
    static let slow = Animation.easeInOut(duration: 0.5)

    static let springResponsive = Animation.spring(
        response: 0.3,
        dampingFraction: 0.7,
        blendDuration: 0.1
    )
}
```

### Common Animations

**Button Press:**
```swift
.scaleEffect(isPressed ? 0.95 : 1.0)
.animation(.quick, value: isPressed)
```

**Message Appearance:**
```swift
.transition(.move(edge: .bottom).combined(with: .opacity))
.animation(.springResponsive, value: message)
```

**Loading Spinner:**
```swift
.rotationEffect(.degrees(isLoading ? 360 : 0))
.animation(
    .linear(duration: 1.0).repeatForever(autoreverses: false),
    value: isLoading
)
```

**Screen Transition:**
```swift
.transition(.asymmetric(
    insertion: .move(edge: .trailing).combined(with: .opacity),
    removal: .move(edge: .leading).combined(with: .opacity)
))
.animation(.standard, value: isPresented)
```

### Haptic Feedback

```swift
import UIKit

enum HapticFeedback {
    static func light() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    static func medium() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    static func success() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }

    static func error() {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
    }
}

// Usage
Button(action: {
    HapticFeedback.light()
    sendMessage()
}) {
    Text("Send")
}
```

---

## Implementation Checklist

### Design System Implementation

- [ ] Color constants in `AppColors` enum
- [ ] Typography constants in `Typography` enum
- [ ] Spacing constants in `Spacing` enum
- [ ] Dark mode support verified
- [ ] Dynamic type support verified

### Component Implementation

- [ ] PrimaryButton component
- [ ] SecondaryButton component
- [ ] Card component
- [ ] MessageBubble component
- [ ] ChatInputField component
- [ ] LoadingView component
- [ ] ErrorBanner component
- [ ] Badge component

### Screen Implementation

- [ ] OnboardingView
- [ ] ChatView
- [ ] ConversationListView
- [ ] DocumentLibraryView
- [ ] SettingsView
- [ ] ModelSelectionView

### Accessibility Audit

- [ ] Color contrast verified (4.5:1 minimum)
- [ ] VoiceOver labels complete
- [ ] Button sizes verified (44×44pt minimum)
- [ ] Dynamic type tested (100%-200%)
- [ ] Keyboard navigation verified
- [ ] Haptic feedback implemented

### Localization Setup

- [ ] Localizable.strings files created
- [ ] All UI strings localized
- [ ] Number formatting locale-aware
- [ ] Date formatting locale-aware
- [ ] Pluralization rules defined

---

**End of Phase 1 Design Specifications**

*This document should be reviewed and approved before implementation begins.*

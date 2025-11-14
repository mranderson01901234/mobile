# iOS Local AI Assistant

**Tagline:** "Your AI that keeps secrets"

A privacy-first iOS application that provides local AI inference using CoreML, enabling secure conversations, document analysis, and voice transcription - all processed entirely on-device.

## 🎯 Project Overview

This iOS app brings powerful AI capabilities to your iPhone while maintaining complete privacy. All processing happens locally on your device - no data ever leaves your iPhone.

### Key Features

- 💬 **Natural Conversations** - Chat with AI models running locally
- 📄 **Document Analysis** - Upload and analyze PDFs, images, and text documents
- 🎤 **Voice Transcription** - Transcribe audio files using on-device Whisper models
- 🔒 **100% Private** - All processing happens on-device, no cloud uploads
- ⚡ **Multiple Models** - Choose from Fast, Balanced, or Advanced models based on your needs
- 🔍 **Semantic Search** - Search across your documents using vector embeddings

## 📋 Requirements

- iOS 17.0+
- iPhone 12+ (A14 Bionic minimum)
- Xcode 15.0+
- Swift 5.9+

## 🏗️ Architecture

The app follows a clean MVVM architecture with the following structure:

```
AppRoot/
├── App/                    # App lifecycle and coordination
├── Models/                 # Data models (Core, Inference, Storage)
├── ViewModels/            # View models for MVVM pattern
├── Views/                 # SwiftUI views organized by feature
├── Services/              # Business logic services
├── Utilities/             # Extensions, helpers, constants
└── Resources/             # Assets, models, localization
```

## 🚀 Getting Started

### Prerequisites

1. Install Xcode 15.0 or later
2. Ensure you have a Mac with Apple Silicon (M1/M2/M3) for best development experience
3. Clone the repository

### Setup

1. Open `iOSLocalAIAssistant.xcodeproj` in Xcode
2. Select your development team in Signing & Capabilities
3. Build and run on a physical device (simulator has limited CoreML support)

### Model Setup

Models are not included in the repository due to size. You'll need to:

1. Download CoreML models separately
2. Place them in `Resources/Models/`
3. Update model configurations in `Services/Inference/ModelManager.swift`

## 📱 Current Status

**Phase 1: Foundation** ✅
- Project structure established
- Core data models defined
- Basic service architecture in place
- UI components scaffolded

**Next Phases:**
- Phase 2: Core inference engine implementation
- Phase 3: Chat interface and conversation management
- Phase 4: Document processing and OCR
- Phase 5: Vector search and memory system
- Phase 6: Settings and model management
- Phase 7: Onboarding and polish

## 🛠️ Development

### Building

```bash
# Using Xcode
open iOSLocalAIAssistant.xcodeproj

# Or using xcodebuild
xcodebuild -project iOSLocalAIAssistant.xcodeproj -scheme iOSLocalAIAssistant -destination 'platform=iOS Simulator,name=iPhone 15 Pro' build
```

### Testing

```bash
xcodebuild test -project iOSLocalAIAssistant.xcodeproj -scheme iOSLocalAIAssistant -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

## 📄 License

MIT License - See LICENSE file for details

## 🤝 Contributing

This is currently a private project. Contributions will be welcome in future phases.

## 📖 Documentation

See `blueprint` file for complete technical specifications, design system, and architecture details.

## 🔐 Privacy

- **Zero Telemetry** - No analytics or tracking
- **No Cloud Uploads** - Everything stays on your device
- **Secure Storage** - All data encrypted at rest
- **Biometric Protection** - Face ID/Touch ID required

---

Built with ❤️ for privacy-conscious users who want powerful AI without compromising their data.


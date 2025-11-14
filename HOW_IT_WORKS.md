# How This Project Works

## 🏗️ Architecture Overview

This iOS app uses **MVVM (Model-View-ViewModel)** architecture pattern. Here's how everything connects:

```
┌─────────────────────────────────────────────────────────┐
│                    iOS App Lifecycle                     │
│  AppDelegate → SceneDelegate → ContentView              │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                    AppCoordinator                        │
│  Manages navigation between Onboarding ↔ Main App        │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                      Views (SwiftUI)                      │
│  ChatView, ConversationListView, DocumentLibraryView     │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                    ViewModels                            │
│  ChatViewModel, ConversationListViewModel, etc.          │
│  (Business logic, state management)                      │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                    Services Layer                        │
│  InferenceEngine, ModelManager, DocumentProcessor        │
│  (Core functionality)                                    │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                    Data Models                           │
│  Conversation, Message, Document, AIModel                │
│  (Data structures)                                        │
└─────────────────────────────────────────────────────────┘
```

## 📱 App Flow

### 1. **App Launch** (`AppDelegate.swift` → `SceneDelegate.swift`)
```swift
// When app starts:
AppDelegate.didFinishLaunchingWithOptions()
  → SceneDelegate.willConnectTo()
    → Creates UIWindow with ContentView as root
```

### 2. **Initial Screen** (`ContentView.swift`)
```swift
ContentView
  ├─ Creates AppCoordinator (@StateObject)
  └─ Shows either:
      ├─ OnboardingView (first time users)
      └─ MainTabView (returning users)
```

### 3. **Navigation Flow** (`AppCoordinator.swift`)
```swift
AppCoordinator manages app-level navigation:
  - currentView: .onboarding or .main
  - navigateToMain() → switches to main app
  - navigateToOnboarding() → switches back to onboarding
```

### 4. **Main App** (`MainTabView`)
```swift
TabView with 3 tabs:
  ├─ Conversations (Chat list)
  ├─ Documents (Document library)
  └─ Settings (App settings)
```

## 🔄 Data Flow Example: Sending a Chat Message

Here's how a user sending a message flows through the system:

```
1. USER ACTION
   User types message and taps send button
   ↓
2. VIEW LAYER (ChatView.swift)
   MessageInputBar captures text
   ↓
3. VIEW MODEL (ChatViewModel.swift)
   ChatViewModel.sendMessage() called
   - Creates Message object
   - Adds to messages array (@Published)
   - Calls inference service
   ↓
4. SERVICE LAYER (InferenceEngine.swift)
   InferenceEngine.generate()
   - Assembles context from conversation history
   - Tokenizes input
   - Loads AI model (CoreML)
   - Generates response token by token
   ↓
5. STREAMING BACK
   Each token streams back via onToken callback
   ↓
6. VIEW MODEL UPDATES
   ChatViewModel receives tokens
   - Updates message content in real-time
   - @Published triggers UI update
   ↓
7. VIEW UPDATES
   SwiftUI automatically re-renders ChatView
   - Shows streaming response
   ↓
8. STORAGE
   ConversationStore saves conversation
   - Persists to local database
```

## 📦 Key Components Explained

### **Models** (`Models/Core/`)
Data structures that represent your app's entities:

- **Conversation**: A chat session with messages
- **Message**: A single message (user or AI)
- **Document**: A file (PDF, image, audio) uploaded by user
- **AIModel**: An AI model configuration (Fast, Balanced, Advanced)

### **ViewModels** (`ViewModels/`)
Business logic layer that connects Views to Services:

- **ChatViewModel**: Manages chat state, sends messages, receives responses
- **ConversationListViewModel**: Manages list of conversations
- **DocumentLibraryViewModel**: Manages document library
- **SettingsViewModel**: Manages app settings

**Key Pattern:**
```swift
@Published var messages: [Message] = []  // Observable state
// When this changes, SwiftUI automatically updates the view
```

### **Services** (`Services/`)
Core functionality that does the actual work:

- **InferenceEngine**: Runs AI models (CoreML) to generate responses
- **ModelManager**: Downloads, manages, selects AI models
- **DocumentProcessor**: Extracts text from PDFs, performs OCR
- **VectorDatabase**: Stores embeddings for semantic search
- **BiometricAuth**: Handles Face ID/Touch ID authentication

### **Views** (`Views/`)
SwiftUI user interface components:

- **ChatView**: The chat interface with message bubbles
- **ConversationListView**: List of all conversations
- **DocumentLibraryView**: Grid/list of uploaded documents
- **Components**: Reusable UI pieces (PrimaryButton, Card)

## 🔧 How Services Work Together

### Example: Processing a Document

```swift
1. User uploads PDF
   ↓
2. DocumentLibraryViewModel.uploadDocument()
   ↓
3. DocumentProcessor.extractText()
   - Uses PDFKit to extract text
   - If no text layer, uses Vision OCR
   ↓
4. DocumentProcessor.chunkDocument()
   - Splits text into chunks (for context limits)
   ↓
5. EmbeddingGenerator.embed()
   - Converts text chunks to vectors
   ↓
6. VectorDatabase.store()
   - Stores embeddings for semantic search
   ↓
7. Document saved to DocumentStore
   - Persisted locally
```

### Example: AI Inference

```swift
1. User sends message: "Analyze this contract"
   ↓
2. ChatViewModel.sendMessage()
   ↓
3. InferenceEngine.generate()
   ├─ ContextAssembler.buildContext()
   │  - Gets conversation history
   │  - Gets relevant document chunks (via VectorDatabase.search())
   │  - Assembles into prompt
   ├─ TokenizerService.encode()
   │  - Converts text to tokens
   ├─ Loads CoreML model
   ├─ Generates tokens one by one
   └─ TokenizerService.decode()
      - Converts tokens back to text
   ↓
4. Streams tokens back to ChatViewModel
   ↓
5. ChatView displays streaming response
```

## 🎨 Design System (`UIConstants.swift`)

All UI styling is centralized:

```swift
UIConstants.primaryBlack      // #000000
UIConstants.gray900           // #1a1a1a
UIConstants.spacingMd         // 16px
UIConstants.heading1          // 24pt Semibold
```

**Why?** Makes it easy to maintain consistent design across the app.

## 🔐 Security Flow

```swift
1. App launches
   ↓
2. BiometricAuth.authenticate()
   - Checks if Face ID/Touch ID available
   - Prompts user for authentication
   ↓
3. If authenticated → App proceeds
   If failed → App locks
   ↓
4. All data encrypted at rest
   - EncryptionService encrypts before saving
   - Keys stored in Secure Enclave
```

## 📊 State Management

The app uses **Combine** framework for reactive state:

```swift
// In ViewModel:
@Published var messages: [Message] = []

// In View:
@StateObject var viewModel: ChatViewModel

// When messages changes:
// → SwiftUI automatically re-renders the view
// → No manual UI updates needed!
```

## 🚀 Current Status (Phase 1)

**What's Working:**
- ✅ Project structure
- ✅ Data models defined
- ✅ Service stubs created
- ✅ Basic UI components
- ✅ Navigation flow

**What Needs Implementation (Phase 2+):**
- ⏳ Xcode project file (.xcodeproj)
- ⏳ CoreML model integration
- ⏳ Actual inference logic
- ⏳ Document processing implementation
- ⏳ Local database (Core Data or SQLite)
- ⏳ Complete UI implementation

## 🎯 Next Steps

1. **Create Xcode Project**: Convert this structure into an actual Xcode project
2. **Implement InferenceEngine**: Add real CoreML model loading and inference
3. **Implement DocumentProcessor**: Add PDF/OCR functionality
4. **Add Storage**: Implement ConversationStore and DocumentStore
5. **Complete UI**: Finish all views with full functionality

## 💡 Key Concepts

- **MVVM**: Separates UI (View) from logic (ViewModel) from data (Model)
- **ObservableObject**: Makes ViewModels reactive (auto-updates UI)
- **@Published**: Properties that trigger UI updates when changed
- **@StateObject**: Creates and owns a ViewModel instance
- **async/await**: Modern Swift concurrency for async operations
- **Combine**: Reactive programming framework

---

**This foundation provides the structure - Phase 2 will add the actual functionality!**


# Development Setup & Workflow Guide

**iOS Local AI Assistant - Phase 1**
**Version:** 1.0
**Last Updated:** 2025-11-14

---

## Quick Start

### Prerequisites

```bash
# System Requirements
- macOS 13.0 or later
- Xcode 15.0 or later
- Swift 5.9 or later
- iOS 17.0 SDK

# Tools
- Git 2.30+
- Homebrew (recommended)
```

### Initial Setup

```bash
# 1. Clone the repository
git clone <repo-url>
cd mobile

# 2. Create local development branch
git checkout -b develop
git pull origin develop

# 3. Set up pre-commit hooks
./scripts/setup-hooks.sh

# 4. Open in Xcode
open LocalAI.xcodeproj
```

---

## Development Environment

### Xcode Configuration

**Build Settings:**
```
Product Name: LocalAI
Bundle Identifier: com.localai.mobile
Minimum Deployment Target: iOS 17.0
Supported Platforms: iPhone
Default Language: English
```

**Schemes:**
- `LocalAI-Debug`: Development with verbose logging
- `LocalAI-Release`: Production-optimized build
- `LocalAI-Tests`: Unit test scheme

**Build Phases:**
1. Compile Sources
2. Link Binary With Libraries
3. Copy Bundle Resources
4. Run Script: Linting (optional)

### Recommended Xcode Extensions

```
- SwiftFormat (Code formatting)
- SwiftLint (Linting)
- GitHub Copilot (AI assistance)
```

### VS Code Setup (Alternative)

```json
// .vscode/settings.json
{
  "sourcekit-lsp.serverPath": "",
  "sourcekit-lsp.swiftPath": "/usr/bin/swift",
  "[swift]": {
    "editor.defaultFormatter": "evals.swift",
    "editor.formatOnSave": true
  }
}
```

---

## Git Workflow

### Branch Strategy

```
main                          # Production releases
├── develop                   # Integration branch (default)
│   ├── feature/[name]       # Feature development
│   ├── bugfix/[name]        # Bug fixes
│   ├── chore/[name]         # Maintenance
│   └── refactor/[name]      # Refactoring
└── release/[version]        # Release preparation
```

### Commit Message Format

```
[TYPE] Brief description (50 chars max)

Detailed explanation of the change (72 chars per line).
Include motivation and context if needed.

Fixes #123
Closes #456

TYPE OPTIONS:
- feat:     New feature
- fix:      Bug fix
- docs:     Documentation
- style:    Code style changes (formatting)
- refactor: Code refactoring
- perf:     Performance improvements
- test:     Tests or test improvements
- chore:    Build, dependencies, tooling
- ci:       CI/CD changes
```

### Creating a Feature Branch

```bash
# 1. Update develop branch
git checkout develop
git pull origin develop

# 2. Create feature branch
git checkout -b feature/chat-ui

# 3. Make changes and commit
git add .
git commit -m "feat: Add initial chat UI layout"

# 4. Push to remote
git push -u origin feature/chat-ui

# 5. Create Pull Request on GitHub
# - Title: [TYPE] Brief description
# - Description: What, why, how, testing steps
# - Link related issues
# - Request reviewers
```

### Code Review Process

**Before Requesting Review:**
- [ ] All tests pass locally
- [ ] Code follows style guide
- [ ] No merge conflicts
- [ ] Documentation updated
- [ ] Self-reviewed the changes

**Review Requirements:**
- Minimum 2 approvals required
- All CI checks must pass
- All conversations resolved

**Merging:**
```bash
# Use "Squash and merge" for feature branches
# This creates a clean history with one commit per feature

# After merge, delete remote branch
git branch -d feature/[name]
git push origin --delete feature/[name]
```

---

## Code Quality Standards

### Swift Style Guide

**Naming Conventions:**
```swift
// Types: PascalCase
struct UserMessage { }
class ChatViewModel { }
enum MessageType { }

// Variables/Constants: camelCase
let isLoading = false
var currentMessage = ""

// Constants: SCREAMING_SNAKE_CASE (only for app-level constants)
let DEFAULT_TIMEOUT = 30

// Private/Internal: Leading underscore (discouraged, use access modifiers)
private let _cache = [:]

// Booleans: is/has prefix
var isActive = true
var hasUnreadMessages = false
```

**Code Organization:**
```swift
class MyViewController {
    // MARK: - Properties
    var property: String

    // MARK: - Lifecycle
    override func viewDidLoad() { }

    // MARK: - Public Methods
    func publicMethod() { }

    // MARK: - Private Methods
    private func privateMethod() { }
}
```

**Spacing & Formatting:**
```swift
// Use 4-space indentation
// Max line length: 100 characters (soft limit)
// Empty lines between sections

// Function parameters
func sendMessage(
    text: String,
    conversationId: UUID,
    options: [String: Any]? = nil
) { }

// Closures
let sorted = array.sorted { a, b in
    a.date > b.date
}
```

### Linting Rules

Using SwiftLint with custom configuration:

```yaml
# .swiftlint.yml
disabled_rules:
  - trailing_comma
  - type_name

opt_in_rules:
  - closure_spacing
  - explicit_init
  - implicitly_unwrapped_optional

rules:
  line_length:
    warning: 100
    error: 120
  function_parameter_count:
    warning: 5
    error: 6
  type_body_length:
    warning: 200
    error: 300
  file_length:
    warning: 500
    error: 1000
```

Run linting:
```bash
# Install SwiftLint
brew install swiftlint

# Run linting
swiftlint

# Auto-fix where possible
swiftlint --fix
```

### Code Review Checklist

**Functionality:**
- [ ] Code does what PR description claims
- [ ] Edge cases are handled
- [ ] Error handling is proper
- [ ] No hardcoded values (magic numbers)

**Quality:**
- [ ] Code is readable and maintainable
- [ ] Follows project conventions
- [ ] No unnecessary complexity
- [ ] DRY principle applied

**Testing:**
- [ ] Unit tests included for logic
- [ ] Happy path tested
- [ ] Edge cases tested
- [ ] No flaky tests

**Performance:**
- [ ] No memory leaks
- [ ] No unnecessary allocations
- [ ] Efficient algorithms used
- [ ] UI remains responsive

**Security:**
- [ ] No hardcoded credentials
- [ ] Input validation present
- [ ] No sensitive data in logs
- [ ] Secure coding practices

**Documentation:**
- [ ] Code comments explain "why"
- [ ] Public APIs documented
- [ ] Complex logic explained
- [ ] README updated if needed

---

## Testing

### Test Structure

```
Tests/
├── Unit/
│   ├── Services/
│   │   ├── InferenceEngineTests.swift
│   │   ├── TokenizerServiceTests.swift
│   │   └── DocumentProcessorTests.swift
│   ├── ViewModels/
│   │   ├── ChatViewModelTests.swift
│   │   └── SettingsViewModelTests.swift
│   └── Models/
│       └── MessageTests.swift
├── Integration/
│   ├── ChatWorkflowTests.swift
│   └── DocumentProcessingTests.swift
├── UI/
│   ├── ChatViewTests.swift
│   └── SettingsViewTests.swift
└── Mocks/
    └── MockServices.swift
```

### Running Tests

```bash
# Run all tests
xcodebuild test -scheme LocalAI

# Run specific test class
xcodebuild test -scheme LocalAI -testPlan ChatViewModelTests

# Run with code coverage
xcodebuild test \
  -scheme LocalAI \
  -configuration Debug \
  -derivedDataPath .build \
  -enableCodeCoverage YES

# Generate coverage report
xcrun llvm-cov report \
  .build/Logs/Test/*.xcactivitylog \
  -use-color
```

### Test Writing Best Practices

```swift
// Arrange-Act-Assert pattern
func testSendingMessageAddsToConversation() {
    // Arrange
    let viewModel = ChatViewModel()
    let initialCount = viewModel.messages.count

    // Act
    viewModel.sendMessage("Hello")

    // Assert
    XCTAssertEqual(viewModel.messages.count, initialCount + 1)
}

// Use descriptive test names
func testInferenceFailsGracefullyWithoutModel() { }

// Test one thing per test
// Use setUp/tearDown for common preparation
// Mock external dependencies
```

---

## Documentation

### Commit Message Guidelines

Every commit should explain:
- **What** changed
- **Why** it changed
- **How** to test it (in PR description)

### PR Description Template

```markdown
## Description
Brief summary of changes

## Motivation
Why are these changes needed?

## Type of Change
- [ ] New feature
- [ ] Bug fix
- [ ] Breaking change
- [ ] Documentation update

## Testing Done
- [ ] Unit tests
- [ ] Integration tests
- [ ] Manual testing on device

## Checklist
- [ ] Code follows style guidelines
- [ ] Tests pass locally
- [ ] No new warnings generated
- [ ] Documentation updated
```

### Code Comments

Good comments explain **why**, not **what**:

```swift
// ❌ Bad - explains what the code does
let count = array.count  // Get the count

// ✅ Good - explains why
// Cache array length to avoid repeated O(n) traversals
let count = array.count

// ✅ Complex logic deserves explanation
// We use exponential backoff to avoid overwhelming the server
// while recovering from transient errors
var retryDelay = 1.0
for attempt in 0..<maxRetries {
    retryDelay *= 2.0
}
```

---

## Performance Profiling

### Instruments Profiling

```bash
# Profile an app
xcodebuild -scheme LocalAI \
  -configuration Release \
  -destination generic/platform=iOS \
  -allowProvisioningUpdates

# Open in Instruments.app
open /Applications/Xcode.app/Contents/Applications/Instruments.app
```

**Key Instruments:**
1. **Time Profiler** - CPU usage and function calls
2. **Memory Leaks** - Detect memory leaks
3. **Allocations** - Memory growth over time
4. **System Trace** - Overall system performance
5. **CoreML Model** - ML inference performance

### Memory Profiling

```swift
// Memory leak detection
import XCTest

func testNoMemoryLeaks() {
    // Set up
    weak var weakViewModel: ChatViewModel?
    do {
        let viewModel = ChatViewModel()
        weakViewModel = viewModel
        // Use viewModel
    }
    // After scope, viewModel should be deallocated
    XCTAssertNil(weakViewModel)
}
```

---

## Continuous Integration

### GitHub Actions Workflow

```yaml
# .github/workflows/ci.yml
name: CI

on: [push, pull_request]

jobs:
  test:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3

      - name: Build and Test
        run: |
          xcodebuild test \
            -scheme LocalAI \
            -configuration Debug

      - name: SwiftLint
        run: |
          brew install swiftlint
          swiftlint

      - name: Upload Coverage
        uses: codecov/codecov-action@v3
```

### Pre-commit Hooks

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Run SwiftLint
swiftlint

if [ $? -ne 0 ]; then
  echo "SwiftLint found issues. Run: swiftlint --fix"
  exit 1
fi

# Run tests
xcodebuild test -scheme LocalAI

if [ $? -ne 0 ]; then
  echo "Tests failed. Fix before committing."
  exit 1
fi
```

---

## Deployment

### App Store Submission

```bash
# 1. Update version in Xcode
#    Settings > General > Version

# 2. Create archive
xcodebuild archive \
  -scheme LocalAI \
  -archivePath ./build/LocalAI.xcarchive \
  -configuration Release

# 3. Export IPA
xcodebuild -exportArchive \
  -archivePath ./build/LocalAI.xcarchive \
  -exportOptionsPlist ExportOptions.plist \
  -exportPath ./build

# 4. Upload to App Store Connect
xcrun altool --upload-app \
  --file ./build/LocalAI.ipa \
  --type ios \
  --apiKey <key> \
  --apiIssuer <issuer>
```

### Beta Testing (TestFlight)

```bash
# Archive and submit to TestFlight
xcodebuild archive ... # (see above)
xcrun altool --upload-app --type ios ...
```

---

## Troubleshooting

### Common Issues

**Issue: Xcode Build Fails**
```bash
# Clean build folder
xcodebuild clean -scheme LocalAI

# Clear derived data
rm -rf ~/Library/Developer/Xcode/DerivedData/*

# Reset Xcode caches
defaults delete com.apple.dt.Xcode
```

**Issue: Swift Compiler Error**
```bash
# Update Swift toolchain
xcode-select --install

# Reinstall Xcode
xcode-select --reset
```

**Issue: Pod/Dependencies Issue**
```bash
# Clean pods
pod cache clean --all
rm -rf Pods
rm Podfile.lock

# Reinstall
pod install
```

---

## Resources

- [Swift Official Documentation](https://swift.org/documentation/)
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [GitHub Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)

---

**Next Steps:**
1. Complete Xcode project setup
2. Implement foundational components
3. Set up CI/CD pipeline
4. Begin Phase 1 development


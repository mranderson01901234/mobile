#!/bin/bash

# Generate Xcode project using xcodegen (if installed)
# Install xcodegen: brew install xcodegen

if command -v xcodegen &> /dev/null; then
    echo "✅ xcodegen found, generating Xcode project..."
    xcodegen generate
    echo "✅ Xcode project generated!"
    echo "   Open iOSLocalAIAssistant.xcodeproj in Xcode"
else
    echo "❌ xcodegen not found"
    echo ""
    echo "Install it with:"
    echo "  brew install xcodegen"
    echo ""
    echo "Or manually create project in Xcode:"
    echo "  1. Open Xcode"
    echo "  2. File → New → Project"
    echo "  3. iOS → App"
    echo "  4. Add existing files"
fi

#!/bin/bash

# Script to create Xcode project for iOS Local AI Assistant
# This script creates the basic Xcode project structure

set -e

PROJECT_NAME="iOSLocalAIAssistant"
PROJECT_DIR="."
BUNDLE_ID="com.localaiassistant.app"

echo "🍎 Creating Xcode project: $PROJECT_NAME"
echo ""

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "⚠️  Warning: This script is designed for macOS"
    echo "   It will create project structure, but you'll need macOS/Xcode to open it"
    echo ""
fi

# Create project directory structure
echo "📁 Creating project structure..."

# Create .xcodeproj directory
XCODE_PROJ_DIR="$PROJECT_DIR/$PROJECT_NAME.xcodeproj"
mkdir -p "$XCODE_PROJ_DIR"

# Create project.pbxproj file (basic structure)
cat > "$XCODE_PROJ_DIR/project.pbxproj" << 'PROJECT_EOF'
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {
/* Begin PBXBuildFile section */
		APP_DELEGATE /* AppDelegate.swift */ = {isa = PBXBuildFile; fileRef = APP_DELEGATE_FILE /* AppDelegate.swift */; };
		SCENE_DELEGATE /* SceneDelegate.swift */ = {isa = PBXBuildFile; fileRef = SCENE_DELEGATE_FILE /* SceneDelegate.swift */; };
		CONTENT_VIEW /* ContentView.swift */ = {isa = PBXBuildFile; fileRef = CONTENT_VIEW_FILE /* ContentView.swift */; };
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
		APP_DELEGATE_FILE /* AppDelegate.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppDelegate.swift; sourceTree = "<group>"; };
		SCENE_DELEGATE_FILE /* SceneDelegate.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SceneDelegate.swift; sourceTree = "<group>"; };
		CONTENT_VIEW_FILE /* ContentView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentView.swift; sourceTree = "<group>"; };
		PRODUCT_FILE /* iOSLocalAIAssistant.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = iOSLocalAIAssistant.app; sourceTree = BUILT_PRODUCTS_DIR; };
		PROJECT_FILE /* project.pbxproj */ = {isa = PBXFileReference; explicitFileType = text.pbxproject; name = project.pbxproj; path = project.pbxproj; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXGroup section */
		SOURCE_GROUP = {
			isa = PBXGroup;
			children = (
				APP_DELEGATE_FILE,
				SCENE_DELEGATE_FILE,
				CONTENT_VIEW_FILE,
			);
			name = Source;
			sourceTree = "<group>";
		};
		PROJECT_GROUP = {
			isa = PBXGroup;
			children = (
				SOURCE_GROUP,
				PROJECT_FILE,
			);
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		APP_TARGET /* iOSLocalAIAssistant */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = BUILD_CONFIG_LIST;
			buildPhases = (
				SOURCES_PHASE,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = iOSLocalAIAssistant;
			productName = iOSLocalAIAssistant;
			productReference = PRODUCT_FILE;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		PROJECT_OBJECT = {
			isa = PBXProject;
			attributes = {
				LastSwiftUpdateCheck = 1500;
				LastUpgradeCheck = 1500;
			};
			buildConfigurationList = PROJECT_BUILD_CONFIG_LIST;
			compatibilityVersion = "Xcode 14.0";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = PROJECT_GROUP;
			productRefGroup = PRODUCT_GROUP;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				APP_TARGET,
			);
		};
/* End PBXProject section */
};
PROJECT_EOF

echo "✅ Created basic Xcode project structure"
echo ""

# Create Info.plist
echo "📝 Creating Info.plist..."
mkdir -p "$PROJECT_DIR/$PROJECT_NAME"
cat > "$PROJECT_DIR/$PROJECT_NAME/Info.plist" << INFOPLIST_EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>$(DEVELOPMENT_LANGUAGE)</string>
	<key>CFBundleDisplayName</key>
	<string>Local AI Assistant</string>
	<key>CFBundleExecutable</key>
	<string>$(EXECUTABLE_NAME)</string>
	<key>CFBundleIdentifier</key>
	<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>$(PRODUCT_NAME)</string>
	<key>CFBundlePackageType</key>
	<string>$(PRODUCT_BUNDLE_PACKAGE_TYPE)</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleVersion</key>
	<string>1</string>
	<key>LSRequiresIPhoneOS</key>
	<true/>
	<key>UIApplicationSceneManifest</key>
	<dict>
		<key>UIApplicationSupportsMultipleScenes</key>
		<true/>
	</dict>
	<key>UIApplicationSupportsIndirectInputEvents</key>
	<true/>
	<key>UILaunchScreen</key>
	<dict/>
	<key>UIRequiredDeviceCapabilities</key>
	<array>
		<string>armv7</string>
	</array>
	<key>UISupportedInterfaceOrientations</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
	<key>UISupportedInterfaceOrientations~ipad</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationPortraitUpsideDown</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
</dict>
</plist>
INFOPLIST_EOF

echo "✅ Created Info.plist"
echo ""

# Create project.yml for xcodegen (alternative method)
echo "📝 Creating project.yml for xcodegen..."
cat > "$PROJECT_DIR/project.yml" << PROJECT_YML_EOF
name: $PROJECT_NAME
options:
  bundleIdPrefix: com.localaiassistant
  deploymentTarget:
    iOS: "17.0"
  developmentLanguage: en
  xcodeVersion: "15.0"

packages: {}

targets:
  $PROJECT_NAME:
    type: application
    platform: iOS
    deploymentTarget: "17.0"
    sources:
      - path: App
      - path: Models
      - path: Views
      - path: ViewModels
      - path: Services
      - path: Utilities
      - path: ContentView.swift
      - path: iOSLocalAIAssistantApp.swift
    settings:
      PRODUCT_BUNDLE_IDENTIFIER: $BUNDLE_ID
      SWIFT_VERSION: "5.9"
      IPHONEOS_DEPLOYMENT_TARGET: "17.0"
      TARGETED_DEVICE_FAMILY: "1,2" # iPhone and iPad
      ASSETCATALOG_COMPILER_APPICON_NAME: AppIcon
    info:
      path: $PROJECT_NAME/Info.plist
      properties:
        UISupportedInterfaceOrientations:
          - UIInterfaceOrientationPortrait
          - UIInterfaceOrientationLandscapeLeft
          - UIInterfaceOrientationLandscapeRight
        UISupportedInterfaceOrientations~ipad:
          - UIInterfaceOrientationPortrait
          - UIInterfaceOrientationPortraitUpsideDown
          - UIInterfaceOrientationLandscapeLeft
          - UIInterfaceOrientationLandscapeRight
        UIApplicationSceneManifest:
          UIApplicationSupportsMultipleScenes: true
PROJECT_YML_EOF

echo "✅ Created project.yml"
echo ""

# Create script to use xcodegen if available
cat > "$PROJECT_DIR/generate_with_xcodegen.sh" << XCODEGEN_EOF
#!/bin/bash

# Generate Xcode project using xcodegen (if installed)
# Install xcodegen: brew install xcodegen

if command -v xcodegen &> /dev/null; then
    echo "✅ xcodegen found, generating Xcode project..."
    xcodegen generate
    echo "✅ Xcode project generated!"
    echo "   Open $PROJECT_NAME.xcodeproj in Xcode"
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
XCODEGEN_EOF

chmod +x "$PROJECT_DIR/generate_with_xcodegen.sh"

echo "✅ Created xcodegen script"
echo ""

# Create manual setup instructions
cat > "$PROJECT_DIR/MANUAL_XCODE_SETUP.md" << MANUAL_EOF
# Manual Xcode Project Setup

If the automated script doesn't work, follow these steps:

## Step 1: Open Xcode
- Launch Xcode on macOS

## Step 2: Create New Project
- File → New → Project
- Choose: **iOS** → **App**
- Click **Next**

## Step 3: Configure Project
- **Product Name:** iOSLocalAIAssistant
- **Team:** Select your Apple ID
- **Organization Identifier:** com.localaiassistant
- **Interface:** SwiftUI ✅
- **Language:** Swift ✅
- **Storage:** None
- **Click Next**

## Step 4: Save Location
- Navigate to: `/path/to/mobile1.0/`
- **Uncheck** "Create Git repository" (we already have one)
- Click **Create**

## Step 5: Delete Default Files
- Delete `ContentView.swift` (we have our own)
- Delete `iOSLocalAIAssistantApp.swift` (we'll use our own)

## Step 6: Add Existing Files
Drag these folders into Xcode (left sidebar):
- `App/` folder
- `Models/` folder
- `Views/` folder
- `ViewModels/` folder
- `Services/` folder
- `Utilities/` folder
- `ContentView.swift` file
- `iOSLocalAIAssistantApp.swift` file

**Important:**
- ✅ Uncheck "Copy items if needed"
- ✅ Check "Create groups"
- ✅ Check "iOSLocalAIAssistant" target

## Step 7: Set App Entry Point
- Make sure `iOSLocalAIAssistantApp.swift` is the main file
- Check: Target → Build Phases → Compile Sources

## Step 8: Configure Info.plist
- Target → Info
- Set iOS Deployment Target: 17.0
- Add required permissions if needed

## Step 9: Build
- Press `⌘ + B` to build
- Fix any import errors
- Press `⌘ + R` to run

## Step 10: Enable Canvas
- Open `ContentView.swift`
- Press `⌘ + ⌥ + Return`
- Click "Resume"
- See live UI! 🎉

Done! Your Xcode project is ready.
MANUAL_EOF

echo "✅ Created manual setup guide"
echo ""

echo "📋 Summary:"
echo "  ✅ Created Xcode project structure"
echo "  ✅ Created project.yml (for xcodegen)"
echo "  ✅ Created generate_with_xcodegen.sh"
echo "  ✅ Created MANUAL_XCODE_SETUP.md"
echo ""
echo "Next steps:"
echo "  1. If you have xcodegen: ./generate_with_xcodegen.sh"
echo "  2. Or follow: MANUAL_XCODE_SETUP.md"
echo "  3. Or use the project in GitHub Actions (workflow will handle it)"
echo ""


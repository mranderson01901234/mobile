# Testing Quick Reference Card

**Phase 2 Week 1 - Build & Test Preview System**

---

## One-Minute Build

```bash
# Terminal commands:
cd /home/user/mobile

# Open in Xcode (if project exists)
open LocalAI.xcodeproj

# Or build from command line
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

---

## What Should Happen

### On Launch
- App opens to **Components tab** (highlighted icon)
- Design system tokens fully visible
- No console errors
- Smooth scrolling

### First View
You'll see:
1. **Dark mode toggle button** (☀️/🌙) in header
2. **All colors** with names and swatches
3. **Typography scale** from largest to smallest
4. **Button examples** (primary, secondary, disabled)
5. **Card & message** examples
6. **Spacing grid** visualization

---

## The 30-Second Test

```
1. App launches?              ✅ Yes / ❌ No
2. Components tab visible?    ✅ Yes / ❌ No
3. Colors show correctly?     ✅ Yes / ❌ No
4. Text readable?             ✅ Yes / ❌ No
5. Toggle button works?       ✅ Yes / ❌ No
6. Dark mode activates?       ✅ Yes / ❌ No
7. Other tabs responsive?     ✅ Yes / ❌ No
8. No crashes?                ✅ Yes / ❌ No
```

**If all ✅ → Ready for Phase 2 Week 2!**

---

## Color Check (Light Mode)

**Backgrounds**
- [ ] Primary: White/very light
- [ ] Secondary: Light gray
- [ ] Tertiary: Slightly darker gray

**Text**
- [ ] Primary: Black/very dark
- [ ] Secondary: Medium gray
- [ ] Tertiary: Light gray

**Semantic**
- [ ] Accent: Bright blue
- [ ] Success: Bright green
- [ ] Warning: Orange
- [ ] Error: Red

---

## Color Check (Dark Mode)

Tap the moon button (🌙) in Components header:

- [ ] Background: Black
- [ ] Text: White
- [ ] Accent: Still blue (visible)
- [ ] Success: Still green
- [ ] Warning: Still orange
- [ ] Error: Still red
- [ ] Borders: Visible dark gray

---

## Tab Testing

Navigate through all 4 tabs:

**Tab 0: Chat**
- [ ] Header shows "Chat"
- [ ] Input field visible
- [ ] Send button responsive
- [ ] Dark mode works

**Tab 1: Components** ← Main test
- [ ] All tokens visible
- [ ] Dark mode toggle works
- [ ] Scrolling smooth
- [ ] Colors distinct

**Tab 2: Design**
- [ ] Color circles show
- [ ] Typography samples visible
- [ ] Spacing info displayed
- [ ] Dark mode works

**Tab 3: Settings**
- [ ] App info displays
- [ ] Toggle switch visible
- [ ] Dark mode works

---

## Common Issues & Fixes

### App Crashes on Launch
```bash
# Check file locations:
ls -la App/LocalAIApp.swift
ls -la Views/Components/ComponentPreviewsView.swift

# Rebuild:
xcodebuild clean -scheme LocalAI
xcodebuild build -scheme LocalAI
```

### Colors Look Wrong
```bash
# Verify UIConstants.swift is added to target
# In Xcode: Select UIConstants.swift → File Inspector
# Check "LocalAI" is selected in Target Membership

# Rebuild with fresh simulator:
xcrun simctl erase all
xcodebuild build -scheme LocalAI
```

### Dark Mode Toggle Doesn't Work
```bash
# Verify code is in ContentView.swift and PreviewProvider.swift
# Rebuild:
xcodebuild clean && xcodebuild build -scheme LocalAI
```

### Simulator Won't Start
```bash
# Reset simulator:
xcrun simctl erase all

# List available:
xcrun simctl list devices

# Try again:
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

---

## Device Options

### Simulator (Recommended)
```bash
# iPhone 15 Pro (large screen)
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'

# iPhone 15 (standard)
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone 15'

# iPhone SE (small screen)
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'platform=iOS Simulator,name=iPhone SE (3rd generation)'
```

### Physical iPhone
```bash
# Connect via USB, then:
xcodebuild build-and-run \
  -scheme LocalAI \
  -destination 'generic/platform=iOS' \
  -allowProvisioningUpdates
```

---

## File Status

✅ **Created (Phase 2 Week 1):**
- `App/LocalAIApp.swift` (15 lines)
- `ContentView.swift` (286 lines)
- `Views/Components/ComponentPreviewsView.swift` (405 lines)
- `Utilities/Helpers/PreviewProvider.swift` (53 lines)

✅ **Already Present (Phase 1):**
- `Utilities/Constants/UIConstants.swift` (210 lines)

📝 **Ready to Build:**
- Create `LocalAI.xcodeproj` in Xcode

---

## Performance Targets

| Metric | Target | Status |
|--------|--------|--------|
| App launch | < 3s | ✅ Should achieve |
| Components render | Instant | ✅ Should achieve |
| Dark mode toggle | < 0.3s | ✅ Should achieve |
| Scrolling | 60 FPS | ✅ Should achieve |
| Memory | < 150MB | ✅ Should achieve |

---

## Success Criteria

Your preview system is working when:

✅ App launches without crashes
✅ All 11 colors display correctly
✅ All 13 typography sizes visible
✅ Buttons are 48pt tall and functional
✅ Cards have visible borders
✅ Message bubbles render properly
✅ Dark mode toggle switches instantly
✅ Colors adapt in dark mode
✅ Text remains readable in both modes
✅ All 4 tabs are responsive
✅ Scrolling is smooth
✅ No memory leaks or crashes
✅ Build completes < 30s

---

## Next: Phase 2 Week 2

Once testing passes, build components:

```
Views/Components/
├── PrimaryButton.swift       (NEW)
├── SecondaryButton.swift     (NEW)
├── Card.swift                (NEW)
├── MessageBubble.swift       (NEW)
├── ChatInputField.swift      (NEW)
└── ComponentPreviewsView.swift (UPDATE with tests)
```

Each component gets:
- Full specifications
- Multiple states (normal, hover, active, disabled)
- Preview in ComponentPreviewsView
- Unit tests

---

## Git Status

```bash
# Latest commits:
d34bcdd feat: Phase 2 Week 1 - Xcode Project & Preview System
aa08d68 docs: Quick build and preview guide
ea93f15 docs: Phase 2 Xcode setup guide
4197410 feat: Phase 1 - Complete Design & Production Blueprint

# Branch: claude/review-thi-012cjzQSn6GTP1PPk4YBudwM
# Status: Up to date with remote
```

---

## Support

**Issue:** Can't find AppColors
→ Check that UIConstants.swift is in Utilities/Constants/

**Issue:** App won't build
→ Run: `xcodebuild clean -scheme LocalAI`

**Issue:** Simulator won't run
→ Run: `xcrun simctl erase all`

**Issue:** Colors wrong
→ Verify hex values in UIConstants.swift

**Need help?**
→ See BUILD_AND_TEST_GUIDE.md (detailed troubleshooting)

---

**Status: Phase 2 Week 1 Ready for Testing! 🚀**


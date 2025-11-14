//
//  UIConstants.swift
//  iOS Local AI Assistant
//
//  Design System & UI Constants - Phase 1
//  Centralized design tokens for consistent, maintainable design
//

import SwiftUI

// MARK: - Semantic Colors
enum AppColors {
    // MARK: - Background Colors
    static let background = Color(UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
        UIColor(hex: "#000000") :
        UIColor(hex: "#FFFFFF")
    })

    static let secondaryBackground = Color(UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
        UIColor(hex: "#1A1A1A") :
        UIColor(hex: "#F9F9F9")
    })

    static let tertiaryBackground = Color(UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
        UIColor(hex: "#2D2D2D") :
        UIColor(hex: "#F0F0F0")
    })

    // MARK: - Text Colors
    static let text = Color(UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
        UIColor(hex: "#FFFFFF") :
        UIColor(hex: "#000000")
    })

    static let textSecondary = Color(UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
        UIColor(hex: "#A0A0A0") :
        UIColor(hex: "#666666")
    })

    static let textTertiary = Color(UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
        UIColor(hex: "#707070") :
        UIColor(hex: "#999999")
    })

    // MARK: - Border & Divider Colors
    static let border = Color(UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
        UIColor(hex: "#404040") :
        UIColor(hex: "#E5E5E5")
    })

    // MARK: - Semantic Colors
    static let accent = Color(hex: "#007AFF")      // iOS Blue
    static let success = Color(hex: "#34C759")     // iOS Green
    static let warning = Color(hex: "#FF9500")     // iOS Orange
    static let error = Color(hex: "#FF3B30")       // iOS Red
}

// MARK: - Typography Scale
enum Typography {
    // MARK: - Display Styles (Large Headlines)
    static let displayLarge = Font.system(size: 32, weight: .bold)
    static let displaySmall = Font.system(size: 28, weight: .bold)

    // MARK: - Heading Styles (Section Titles)
    static let headingLarge = Font.system(size: 24, weight: .semibold)
    static let headingMedium = Font.system(size: 20, weight: .semibold)
    static let headingSmall = Font.system(size: 18, weight: .semibold)

    // MARK: - Body Styles (Main Content)
    static let bodyLarge = Font.system(size: 16, weight: .regular)
    static let bodyMedium = Font.system(size: 15, weight: .regular)
    static let bodySmall = Font.system(size: 14, weight: .regular)

    // MARK: - Label Styles (UI Text, Metadata)
    static let labelLarge = Font.system(size: 13, weight: .semibold)
    static let labelMedium = Font.system(size: 12, weight: .semibold)
    static let labelSmall = Font.system(size: 11, weight: .semibold)

    // MARK: - Caption (Smallest Text)
    static let caption = Font.system(size: 11, weight: .regular)
}

// MARK: - Spacing Scale (8pt Grid)
enum Spacing {
    static let xs2 = CGFloat(4)      // Extra extra small
    static let xs = CGFloat(8)       // Extra small
    static let sm = CGFloat(12)      // Small
    static let md = CGFloat(16)      // Medium (primary screen padding)
    static let lg = CGFloat(24)      // Large (section spacing)
    static let xl = CGFloat(32)      // Extra large
    static let xl2 = CGFloat(48)     // Extra large 2
    static let xl3 = CGFloat(64)     // Extra large 3
}

// MARK: - Corner Radius
enum CornerRadius {
    static let small = CGFloat(4)
    static let medium = CGFloat(8)
    static let large = CGFloat(12)
    static let extraLarge = CGFloat(16)
}

// MARK: - Animations
enum AppAnimations {
    static let quick = Animation.easeInOut(duration: 0.2)
    static let standard = Animation.easeInOut(duration: 0.3)
    static let slow = Animation.easeInOut(duration: 0.5)

    static let springResponsive = Animation.spring(
        response: 0.3,
        dampingFraction: 0.7,
        blendDuration: 0.1
    )

    static let springBouncy = Animation.spring(
        response: 0.6,
        dampingFraction: 0.6,
        blendDuration: 0.1
    )
}

// MARK: - Component Sizes
enum ComponentSize {
    static let touchTargetMinimum = CGFloat(44)  // WCAG 2.1 AAA minimum
    static let buttonSmall = CGFloat(36)
    static let buttonMedium = CGFloat(44)
    static let buttonLarge = CGFloat(48)
    static let inputSmall = CGFloat(36)
    static let inputMedium = CGFloat(44)
    static let inputLarge = CGFloat(56)
    static let cardMinHeight = CGFloat(60)
    static let cardMaxWidth = CGFloat(300)
}

// MARK: - Accessibility
enum Accessibility {
    static let minimumContrastRatio = 4.5
    static let minScaleFactor = 0.8
    static let maxScaleFactor = 1.2
    static let captionLineLimit = 2
    static let headlineLineLimit = 3
}

// MARK: - Backward Compatibility
enum UIConstants {
    // Legacy color names
    static let primaryBlack = Color(hex: "#000000")
    static let primaryWhite = Color(hex: "#FFFFFF")
    static let gray900 = Color(hex: "#1a1a1a")
    static let gray700 = Color(hex: "#404040")
    static let gray500 = Color(hex: "#737373")
    static let gray300 = Color(hex: "#d4d4d4")
    static let gray100 = Color(hex: "#f5f5f5")

    // Legacy spacing names
    static let spacing2xs: CGFloat = 4
    static let spacingXs: CGFloat = 8
    static let spacingSm: CGFloat = 12
    static let spacingMd: CGFloat = 16
    static let spacingLg: CGFloat = 24
    static let spacingXl: CGFloat = 32
    static let spacing2xl: CGFloat = 48
    static let spacing3xl: CGFloat = 64

    // Legacy typography names
    static let displayLarge: Font = .system(size: 32, weight: .bold)
    static let displayMedium: Font = .system(size: 28, weight: .bold)
    static let heading1: Font = .system(size: 24, weight: .semibold)
    static let heading2: Font = .system(size: 20, weight: .semibold)
    static let heading3: Font = .system(size: 18, weight: .semibold)
    static let bodyLarge: Font = .system(size: 17, weight: .regular)
    static let body: Font = .system(size: 15, weight: .regular)
    static let bodySmall: Font = .system(size: 13, weight: .regular)
    static let caption: Font = .system(size: 11, weight: .regular)
}

// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


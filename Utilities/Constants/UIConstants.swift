//
//  UIConstants.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import SwiftUI

enum UIConstants {
    // Colors
    static let primaryBlack = Color(hex: "#000000")
    static let primaryWhite = Color(hex: "#FFFFFF")
    static let gray900 = Color(hex: "#1a1a1a")
    static let gray700 = Color(hex: "#404040")
    static let gray500 = Color(hex: "#737373")
    static let gray300 = Color(hex: "#d4d4d4")
    static let gray100 = Color(hex: "#f5f5f5")
    
    // Spacing
    static let spacing2xs: CGFloat = 4
    static let spacingXs: CGFloat = 8
    static let spacingSm: CGFloat = 12
    static let spacingMd: CGFloat = 16
    static let spacingLg: CGFloat = 24
    static let spacingXl: CGFloat = 32
    static let spacing2xl: CGFloat = 48
    static let spacing3xl: CGFloat = 64
    
    // Typography
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


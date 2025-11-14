//
//  AppConstants.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

enum AppConstants {
    static let appName = "iOS Local AI Assistant"
    static let appVersion = "1.0.0"
    static let minimumiOSVersion = "17.0"
    
    // Storage
    static let documentsDirectoryName = "Documents"
    static let modelsDirectoryName = "Models"
    static let conversationsDirectoryName = "Conversations"
    
    // Limits
    static let maxContextTokens = 6000
    static let maxMessageLength = 10000
    static let maxDocumentSize: Int64 = 100 * 1024 * 1024 // 100MB
}


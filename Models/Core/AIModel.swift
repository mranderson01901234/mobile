//
//  AIModel.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

struct AIModel: Identifiable, Codable {
    let id: String
    var name: String
    var type: ModelType
    var size: Int64 // bytes
    var parameterCount: String // "8B"
    var quantization: String // "4-bit"
    var isDownloaded: Bool
    var isBundled: Bool
    var fileURL: URL
    var downloadURL: URL
    var capabilities: [ModelCapability]
    var speedRating: Int // 1-5
    var qualityRating: Int // 1-5
    
    var filename: String {
        "\(id).mlpackage"
    }
    
    enum ModelType: String, Codable {
        case fast
        case balanced
        case advanced
        case code
        case voice
    }
    
    enum ModelCapability: String, Codable {
        case chat
        case document
        case analysis
        case reasoning
        case code
        case voice
    }
}


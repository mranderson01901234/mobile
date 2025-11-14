//
//  Message.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

struct Message: Identifiable, Codable {
    let id: UUID
    var role: MessageRole
    var content: String
    var timestamp: Date
    var attachments: [String] // Document IDs
    var tokenCount: Int
    var inferenceTime: TimeInterval?
    var modelUsed: String?
    
    init(
        id: UUID = UUID(),
        role: MessageRole,
        content: String,
        timestamp: Date = Date(),
        attachments: [String] = [],
        tokenCount: Int = 0,
        inferenceTime: TimeInterval? = nil,
        modelUsed: String? = nil
    ) {
        self.id = id
        self.role = role
        self.content = content
        self.timestamp = timestamp
        self.attachments = attachments
        self.tokenCount = tokenCount
        self.inferenceTime = inferenceTime
        self.modelUsed = modelUsed
    }
    
    enum MessageRole: String, Codable {
        case user
        case assistant
        case system
    }
}


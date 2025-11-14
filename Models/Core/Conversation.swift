//
//  Conversation.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

struct Conversation: Identifiable, Codable {
    let id: UUID
    var title: String
    var messages: [Message]
    var createdAt: Date
    var updatedAt: Date
    var model: String // Model ID used
    
    init(
        id: UUID = UUID(),
        title: String,
        messages: [Message] = [],
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        model: String = "fast-model"
    ) {
        self.id = id
        self.title = title
        self.messages = messages
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.model = model
    }
    
    static var empty: Conversation {
        Conversation(
            title: "New Chat",
            messages: [],
            model: "fast-model"
        )
    }
}


//
//  ConversationStore.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

class ConversationStore {
    func save(_ conversation: Conversation) throws {
        // TODO: Implement conversation persistence
    }
    
    func load(id: UUID) throws -> Conversation? {
        // TODO: Implement conversation loading
        return nil
    }
    
    func loadAll() throws -> [Conversation] {
        // TODO: Implement loading all conversations
        return []
    }
    
    func delete(_ conversation: Conversation) throws {
        // TODO: Implement conversation deletion
    }
}


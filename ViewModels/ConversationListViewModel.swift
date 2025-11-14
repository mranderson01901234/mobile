//
//  ConversationListViewModel.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation
import Combine
import SwiftUI

class ConversationListViewModel: ObservableObject {
    @Published var conversations: [Conversation] = []
    @Published var searchText: String = ""
    
    private let conversationStore: ConversationStore
    
    init(conversationStore: ConversationStore) {
        self.conversationStore = conversationStore
        loadConversations()
    }
    
    func loadConversations() {
        // TODO: Load conversations from store
        conversations = []
    }
    
    func createNewConversation() -> Conversation {
        let conversation = Conversation.empty
        conversations.insert(conversation, at: 0)
        return conversation
    }
    
    func deleteConversation(_ conversation: Conversation) {
        conversations.removeAll { $0.id == conversation.id }
        // TODO: Delete from store
    }
}


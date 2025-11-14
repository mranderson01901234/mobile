//
//  ChatViewModel.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation
import Combine
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var currentInput: String = ""
    @Published var isGenerating: Bool = false
    @Published var conversation: Conversation
    
    private let inferenceEngine: InferenceEngine
    private let modelManager: ModelManager
    
    init(conversation: Conversation, inferenceEngine: InferenceEngine, modelManager: ModelManager) {
        self.conversation = conversation
        self.inferenceEngine = inferenceEngine
        self.modelManager = modelManager
        self.messages = conversation.messages
    }
    
    func sendMessage() async {
        guard !currentInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        let userMessage = Message(
            role: .user,
            content: currentInput,
            tokenCount: estimateTokenCount(currentInput)
        )
        
        await MainActor.run {
            messages.append(userMessage)
            currentInput = ""
            isGenerating = true
        }
        
        // TODO: Generate AI response
        // let response = try await inferenceEngine.generate(...)
        
        await MainActor.run {
            isGenerating = false
        }
    }
    
    private func estimateTokenCount(_ text: String) -> Int {
        // Rough estimate: ~4 characters per token
        return text.count / 4
    }
}


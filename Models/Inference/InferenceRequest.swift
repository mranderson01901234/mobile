//
//  InferenceRequest.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

struct InferenceRequest {
    let prompt: String
    let conversation: Conversation
    let documents: [Document]
    let maxTokens: Int
    let temperature: Float
    let modelId: String
    
    init(
        prompt: String,
        conversation: Conversation,
        documents: [Document] = [],
        maxTokens: Int = 1000,
        temperature: Float = 0.7,
        modelId: String = "fast-model"
    ) {
        self.prompt = prompt
        self.conversation = conversation
        self.documents = documents
        self.maxTokens = maxTokens
        self.temperature = temperature
        self.modelId = modelId
    }
}


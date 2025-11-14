//
//  InferenceResponse.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

struct InferenceResponse {
    let text: String
    let tokensGenerated: Int
    let inferenceTime: TimeInterval
    let tokensPerSecond: Double
    let modelUsed: String
    
    init(
        text: String,
        tokensGenerated: Int,
        inferenceTime: TimeInterval,
        tokensPerSecond: Double,
        modelUsed: String
    ) {
        self.text = text
        self.tokensGenerated = tokensGenerated
        self.inferenceTime = inferenceTime
        self.tokensPerSecond = tokensPerSecond
        self.modelUsed = modelUsed
    }
}


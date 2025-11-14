//
//  TokenStream.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

struct TokenStream {
    let token: String
    let isComplete: Bool
    
    init(token: String, isComplete: Bool = false) {
        self.token = token
        self.isComplete = isComplete
    }
}


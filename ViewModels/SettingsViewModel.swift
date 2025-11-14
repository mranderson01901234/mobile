//
//  SettingsViewModel.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation
import Combine
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var availableModels: [AIModel] = []
    @Published var activeModel: AIModel?
    @Published var autoModelSelection: Bool = true
    @Published var batterySaverMode: Bool = false
    
    private let modelManager: ModelManager
    
    init(modelManager: ModelManager) {
        self.modelManager = modelManager
        loadSettings()
    }
    
    func loadSettings() {
        // TODO: Load settings and models
        availableModels = modelManager.availableModels
        activeModel = modelManager.activeModel
    }
    
    func selectModel(_ model: AIModel) {
        activeModel = model
        // TODO: Save selection
    }
}


//
//  AppCoordinator.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var currentView: AppView = .onboarding
    
    enum AppView {
        case onboarding
        case main
    }
    
    func navigateToMain() {
        currentView = .main
    }
    
    func navigateToOnboarding() {
        currentView = .onboarding
    }
}


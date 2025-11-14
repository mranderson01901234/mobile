//
//  LocalAIApp.swift
//  iOS Local AI Assistant
//
//  Application entry point with window configuration
//  Phase 2 - Preview System
//

import SwiftUI

@main
struct LocalAIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(nil)  // Respect system dark mode setting
        }
    }
}

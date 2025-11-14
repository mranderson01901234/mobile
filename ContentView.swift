//
//  ContentView.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        Group {
            switch coordinator.currentView {
            case .onboarding:
                OnboardingView(coordinator: coordinator)
            case .main:
                MainTabView()
            }
        }
    }
}

struct OnboardingView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: UIConstants.spacingXl) {
            Text("🔒")
                .font(.system(size: 64))
            
            Text("Your AI That Keeps Secrets")
                .font(UIConstants.displayLarge)
                .multilineTextAlignment(.center)
            
            Text("Everything stays on your iPhone.\nWe literally never see your data.")
                .font(UIConstants.bodyLarge)
                .multilineTextAlignment(.center)
                .foregroundColor(UIConstants.gray700)
            
            Spacer()
            
            PrimaryButton(title: "Continue") {
                coordinator.navigateToMain()
            }
            .padding(.horizontal, UIConstants.spacingMd)
        }
        .padding()
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            ConversationListView()
                .tabItem {
                    Label("Chats", systemImage: "message")
                }
            
            DocumentLibraryView()
                .tabItem {
                    Label("Documents", systemImage: "doc")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ConversationListView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Conversations")
                    .font(UIConstants.heading1)
                Text("Phase 1 Foundation - Coming Soon")
                    .font(UIConstants.body)
                    .foregroundColor(UIConstants.gray500)
            }
            .navigationTitle("Conversations")
        }
    }
}

struct DocumentLibraryView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Documents")
                    .font(UIConstants.heading1)
                Text("Phase 1 Foundation - Coming Soon")
                    .font(UIConstants.body)
                    .foregroundColor(UIConstants.gray500)
            }
            .navigationTitle("Documents")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(UIConstants.heading1)
                Text("Phase 1 Foundation - Coming Soon")
                    .font(UIConstants.body)
                    .foregroundColor(UIConstants.gray500)
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}


//
//  ContentView.swift
//  iOS Local AI Assistant
//
//  Root view with tab navigation and preview system
//  Phase 2 - Preview System Implementation
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1  // Default to Components tab

    var body: some View {
        TabView(selection: $selectedTab) {
            // MARK: - Chat Tab
            ChatViewPreview()
                .tabItem {
                    Label("Chat", systemImage: "bubble.left.fill")
                }
                .tag(0)

            // MARK: - Components Tab (DESIGN SYSTEM)
            ComponentPreviewsView()
                .tabItem {
                    Label("Components", systemImage: "square.grid.2x2")
                }
                .tag(1)

            // MARK: - Design System Info
            DesignSystemPreview()
                .tabItem {
                    Label("Design", systemImage: "paintpalette.fill")
                }
                .tag(2)

            // MARK: - Settings
            SettingsViewPreview()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(3)
        }
        .preferredColorScheme(nil)
    }
}

// MARK: - Chat Screen Preview
struct ChatViewPreview: View {
    @State private var messageText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.background
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // Header
                    HStack {
                        Text("Chat")
                            .font(.headingLarge)
                            .foregroundColor(AppColors.text)

                        Spacer()

                        Button(action: {}) {
                            Image(systemName: "ellipsis")
                                .foregroundColor(AppColors.text)
                        }
                    }
                    .padding(Spacing.md)
                    .background(AppColors.secondaryBackground)
                    .border(AppColors.border, width: 1)

                    // Messages area (placeholder)
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        Text("Start a conversation")
                            .font(.bodyMedium)
                            .foregroundColor(AppColors.textSecondary)
                            .padding(Spacing.md)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(AppColors.background)

                    // Input area
                    HStack(spacing: Spacing.sm) {
                        TextField("Type a message...", text: $messageText)
                            .font(.bodyMedium)
                            .padding(.horizontal, Spacing.md)
                            .padding(.vertical, Spacing.sm)
                            .background(AppColors.secondaryBackground)
                            .border(AppColors.border, width: 1)
                            .cornerRadius(CornerRadius.large)
                            .frame(height: 44)

                        Button(action: {}) {
                            Image(systemName: "arrow.up.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(
                                    messageText.isEmpty ? AppColors.textTertiary : AppColors.accent
                                )
                        }
                        .disabled(messageText.isEmpty)
                    }
                    .padding(Spacing.md)
                }
            }
            .navigationTitle("Chat", displayMode: .inline)
        }
    }
}

// MARK: - Design System Info
struct DesignSystemPreview: View {
    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.background
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.lg) {
                        // Colors Section
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("Colors")
                                .font(.headingLarge)
                                .foregroundColor(AppColors.text)

                            HStack(spacing: Spacing.md) {
                                Circle()
                                    .fill(AppColors.accent)
                                    .frame(width: 40, height: 40)
                                Text("Accent (Blue)")
                                    .font(.bodyMedium)
                                    .foregroundColor(AppColors.text)
                                Spacer()
                            }

                            HStack(spacing: Spacing.md) {
                                Circle()
                                    .fill(AppColors.success)
                                    .frame(width: 40, height: 40)
                                Text("Success (Green)")
                                    .font(.bodyMedium)
                                    .foregroundColor(AppColors.text)
                                Spacer()
                            }

                            HStack(spacing: Spacing.md) {
                                Circle()
                                    .fill(AppColors.warning)
                                    .frame(width: 40, height: 40)
                                Text("Warning (Orange)")
                                    .font(.bodyMedium)
                                    .foregroundColor(AppColors.text)
                                Spacer()
                            }

                            HStack(spacing: Spacing.md) {
                                Circle()
                                    .fill(AppColors.error)
                                    .frame(width: 40, height: 40)
                                Text("Error (Red)")
                                    .font(.bodyMedium)
                                    .foregroundColor(AppColors.text)
                                Spacer()
                            }
                        }
                        .padding(Spacing.md)

                        Divider()
                            .padding(.horizontal, Spacing.md)

                        // Typography Section
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("Typography")
                                .font(.headingLarge)
                                .foregroundColor(AppColors.text)

                            Text("Display Large")
                                .font(.displayLarge)
                                .foregroundColor(AppColors.text)

                            Text("Body Medium")
                                .font(.bodyMedium)
                                .foregroundColor(AppColors.text)

                            Text("Caption")
                                .font(.caption)
                                .foregroundColor(AppColors.textSecondary)
                        }
                        .padding(Spacing.md)

                        Divider()
                            .padding(.horizontal, Spacing.md)

                        // Spacing Section
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("Spacing (8pt Grid)")
                                .font(.headingLarge)
                                .foregroundColor(AppColors.text)

                            Text("All spacing follows an 8pt grid system for perfect alignment")
                                .font(.bodySmall)
                                .foregroundColor(AppColors.textSecondary)
                        }
                        .padding(Spacing.md)
                    }
                    .padding(.vertical, Spacing.md)
                }
            }
            .navigationTitle("Design System", displayMode: .inline)
        }
    }
}

// MARK: - Settings Preview
struct SettingsViewPreview: View {
    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.background
                    .ignoresSafeArea()

                List {
                    Section("App Information") {
                        HStack {
                            Text("App Name")
                                .font(.bodyMedium)
                            Spacer()
                            Text("Local AI")
                                .font(.bodySmall)
                                .foregroundColor(AppColors.textSecondary)
                        }

                        HStack {
                            Text("Version")
                                .font(.bodyMedium)
                            Spacer()
                            Text("1.0.0")
                                .font(.bodySmall)
                                .foregroundColor(AppColors.textSecondary)
                        }

                        HStack {
                            Text("Build")
                                .font(.bodyMedium)
                            Spacer()
                            Text("1")
                                .font(.bodySmall)
                                .foregroundColor(AppColors.textSecondary)
                        }
                    }

                    Section("Preferences") {
                        Toggle("Developer Mode", isOn: .constant(false))
                    }
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
                .background(AppColors.background)
            }
            .navigationTitle("Settings", displayMode: .inline)
        }
    }
}

// MARK: - Previews
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")

            ContentView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
#endif


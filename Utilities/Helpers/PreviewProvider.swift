//
//  PreviewProvider.swift
//  iOS Local AI Assistant
//
//  Preview environment setup for SwiftUI Canvas and previews
//  Enables easy dark mode toggling and preview management
//

import SwiftUI

// MARK: - Preview Container
/// Wraps preview content with a dark mode toggle and standard background
struct PreviewContainer<Content: View>: View {
    let content: Content
    @State private var isDarkMode = false

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            AppColors.background
                .ignoresSafeArea()

            VStack(spacing: Spacing.md) {
                // Header with dark mode toggle
                HStack {
                    Text("Preview")
                        .font(.headingSmall)
                        .foregroundColor(AppColors.text)

                    Spacer()

                    Button(action: { isDarkMode.toggle() }) {
                        Image(systemName: isDarkMode ? "sun.max" : "moon")
                            .font(.system(size: 16))
                            .foregroundColor(AppColors.text)
                    }
                }
                .padding(Spacing.md)
                .background(AppColors.secondaryBackground)
                .border(AppColors.border, width: 1)
                .cornerRadius(CornerRadius.large)
                .padding(Spacing.md)

                // Content
                ScrollView {
                    content
                        .padding(Spacing.md)
                }

                Spacer()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

// MARK: - Preview Extensions
#if DEBUG
extension View {
    /// Wraps view in preview container with dark mode toggle
    func previewContainer() -> some View {
        PreviewContainer { self }
    }

    /// Shows both light and dark mode previews side by side
    func previewBoth() -> some View {
        Group {
            self
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")

            self
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }

    /// Shows preview on a specific device
    func previewOnDevice(_ name: String) -> some View {
        self.previewDevice(PreviewDevice(rawValue: name))
            .previewDisplayName(name)
    }
}
#endif

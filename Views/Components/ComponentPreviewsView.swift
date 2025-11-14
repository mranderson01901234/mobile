//
//  ComponentPreviewsView.swift
//  iOS Local AI Assistant
//
//  Preview all components and design system tokens
//  Used for visual verification during development
//

import SwiftUI

struct ComponentPreviewsView: View {
    @State private var isDarkMode = false

    var body: some View {
        ZStack {
            AppColors.background
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: Spacing.lg) {
                    // Header with dark mode toggle
                    HStack {
                        Text("Design System")
                            .font(.headingLarge)
                            .foregroundColor(AppColors.text)

                        Spacer()

                        Button(action: { isDarkMode.toggle() }) {
                            Image(systemName: isDarkMode ? "sun.max" : "moon")
                                .font(.system(size: 18))
                                .foregroundColor(AppColors.text)
                        }
                    }
                    .padding(Spacing.md)

                    // MARK: - Colors Section
                    VStack(alignment: .leading, spacing: Spacing.sm) {
                        Text("Colors")
                            .font(.headingLarge)
                            .foregroundColor(AppColors.text)

                        VStack(spacing: Spacing.sm) {
                            ColorRow(name: "Background", color: AppColors.background)
                            ColorRow(name: "Secondary Background", color: AppColors.secondaryBackground)
                            ColorRow(name: "Tertiary Background", color: AppColors.tertiaryBackground)
                            ColorRow(name: "Text Primary", color: AppColors.text)
                            ColorRow(name: "Text Secondary", color: AppColors.textSecondary)
                            ColorRow(name: "Text Tertiary", color: AppColors.textTertiary)
                            ColorRow(name: "Border", color: AppColors.border)
                            ColorRow(name: "Accent (Blue)", color: AppColors.accent)
                            ColorRow(name: "Success (Green)", color: AppColors.success)
                            ColorRow(name: "Warning (Orange)", color: AppColors.warning)
                            ColorRow(name: "Error (Red)", color: AppColors.error)
                        }
                    }
                    .padding(Spacing.md)

                    Divider()
                        .padding(.horizontal, Spacing.md)

                    // MARK: - Typography Section
                    VStack(alignment: .leading, spacing: Spacing.sm) {
                        Text("Typography")
                            .font(.headingLarge)
                            .foregroundColor(AppColors.text)

                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("Display Large (32pt Bold)")
                                .font(.displayLarge)
                                .foregroundColor(AppColors.text)

                            Text("Display Small (28pt Bold)")
                                .font(.displaySmall)
                                .foregroundColor(AppColors.text)

                            Text("Heading Large (24pt Semibold)")
                                .font(.headingLarge)
                                .foregroundColor(AppColors.text)

                            Text("Heading Medium (20pt Semibold)")
                                .font(.headingMedium)
                                .foregroundColor(AppColors.text)

                            Text("Heading Small (18pt Semibold)")
                                .font(.headingSmall)
                                .foregroundColor(AppColors.text)

                            Text("Body Large (16pt Regular)")
                                .font(.bodyLarge)
                                .foregroundColor(AppColors.text)

                            Text("Body Medium (15pt Regular)")
                                .font(.bodyMedium)
                                .foregroundColor(AppColors.text)

                            Text("Body Small (14pt Regular)")
                                .font(.bodySmall)
                                .foregroundColor(AppColors.text)

                            Text("Label Large (13pt Semibold)")
                                .font(.labelLarge)
                                .foregroundColor(AppColors.text)

                            Text("Caption (11pt Regular)")
                                .font(.caption)
                                .foregroundColor(AppColors.textSecondary)
                        }
                    }
                    .padding(Spacing.md)

                    Divider()
                        .padding(.horizontal, Spacing.md)

                    // MARK: - Buttons Section
                    VStack(alignment: .leading, spacing: Spacing.sm) {
                        Text("Buttons")
                            .font(.headingLarge)
                            .foregroundColor(AppColors.text)

                        VStack(spacing: Spacing.md) {
                            // Primary Button
                            Button(action: {}) {
                                Text("Primary Button")
                                    .font(.bodyMedium)
                                    .fontWeight(.semibold)
                            }
                            .frame(height: ComponentSize.buttonLarge)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(AppColors.accent)
                            .cornerRadius(CornerRadius.large)

                            // Secondary Button
                            Button(action: {}) {
                                Text("Secondary Button")
                                    .font(.bodyMedium)
                                    .fontWeight(.semibold)
                                    .foregroundColor(AppColors.accent)
                            }
                            .frame(height: ComponentSize.buttonLarge)
                            .frame(maxWidth: .infinity)
                            .background(AppColors.tertiaryBackground)
                            .border(AppColors.border, width: 1)
                            .cornerRadius(CornerRadius.large)

                            // Disabled Button
                            Button(action: {}) {
                                Text("Disabled Button")
                                    .font(.bodyMedium)
                                    .fontWeight(.semibold)
                            }
                            .frame(height: ComponentSize.buttonLarge)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(AppColors.textTertiary)
                            .cornerRadius(CornerRadius.large)
                            .disabled(true)
                        }
                    }
                    .padding(Spacing.md)

                    Divider()
                        .padding(.horizontal, Spacing.md)

                    // MARK: - Cards & Messages Section
                    VStack(alignment: .leading, spacing: Spacing.sm) {
                        Text("Cards & Messages")
                            .font(.headingLarge)
                            .foregroundColor(AppColors.text)

                        // Card Example
                        VStack(alignment: .leading, spacing: Spacing.md) {
                            Text("Card Title")
                                .font(.headingSmall)
                                .foregroundColor(AppColors.text)

                            Text("This is a card component with content inside. It has padding, border, and corner radius.")
                                .font(.bodySmall)
                                .foregroundColor(AppColors.textSecondary)
                        }
                        .padding(Spacing.md)
                        .background(AppColors.secondaryBackground)
                        .border(AppColors.border, width: 1)
                        .cornerRadius(CornerRadius.large)

                        // Message Bubbles
                        VStack(spacing: Spacing.md) {
                            // User Message
                            HStack(alignment: .bottom, spacing: Spacing.sm) {
                                Spacer()

                                VStack(alignment: .trailing, spacing: Spacing.xs) {
                                    Text("This is a user message")
                                        .font(.bodyMedium)
                                        .foregroundColor(.white)

                                    Text("2:45 PM")
                                        .font(.caption)
                                        .foregroundColor(Color.white.opacity(0.7))
                                }
                                .padding(.horizontal, Spacing.md)
                                .padding(.vertical, Spacing.sm)
                                .background(AppColors.accent)
                                .cornerRadius(CornerRadius.extraLarge)
                            }

                            // Assistant Message
                            HStack(alignment: .bottom, spacing: Spacing.sm) {
                                VStack(alignment: .leading, spacing: Spacing.xs) {
                                    Text("This is an assistant response")
                                        .font(.bodyMedium)
                                        .foregroundColor(AppColors.text)

                                    Text("2:46 PM")
                                        .font(.caption)
                                        .foregroundColor(AppColors.textSecondary)
                                }
                                .padding(.horizontal, Spacing.md)
                                .padding(.vertical, Spacing.sm)
                                .background(AppColors.tertiaryBackground)
                                .cornerRadius(CornerRadius.extraLarge)

                                Spacer()
                            }
                        }
                        .padding(Spacing.md)
                    }
                    .padding(Spacing.md)

                    Divider()
                        .padding(.horizontal, Spacing.md)

                    // MARK: - Spacing Section
                    VStack(alignment: .leading, spacing: Spacing.sm) {
                        Text("Spacing Scale (8pt Grid)")
                            .font(.headingLarge)
                            .foregroundColor(AppColors.text)

                        VStack(alignment: .leading, spacing: Spacing.xs) {
                            SpacingRow(label: "xs2", value: "4pt")
                            SpacingRow(label: "xs", value: "8pt")
                            SpacingRow(label: "sm", value: "12pt")
                            SpacingRow(label: "md", value: "16pt")
                            SpacingRow(label: "lg", value: "24pt")
                            SpacingRow(label: "xl", value: "32pt")
                            SpacingRow(label: "xl2", value: "48pt")
                            SpacingRow(label: "xl3", value: "64pt")
                        }
                    }
                    .padding(Spacing.md)

                    // Bottom padding
                    Spacer()
                        .frame(height: Spacing.xl)
                }
                .padding(.vertical, Spacing.md)
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

// MARK: - Helper Views

struct ColorRow: View {
    let name: String
    let color: Color

    var body: some View {
        HStack(spacing: Spacing.md) {
            color
                .frame(width: 60, height: 60)
                .cornerRadius(CornerRadius.medium)
                .border(AppColors.border, width: 1)

            VStack(alignment: .leading, spacing: Spacing.xs2) {
                Text(name)
                    .font(.bodyMedium)
                    .foregroundColor(AppColors.text)
            }

            Spacer()
        }
    }
}

struct SpacingRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.labelLarge)
                .foregroundColor(AppColors.text)
                .frame(width: 50, alignment: .leading)

            Text(value)
                .font(.bodySmall)
                .foregroundColor(AppColors.textSecondary)
                .frame(width: 60, alignment: .leading)

            Spacer()

            // Visual representation
            RoundedRectangle(cornerRadius: 2)
                .fill(AppColors.accent)
                .frame(width: 40, height: 8)
        }
    }
}

// MARK: - Previews
#if DEBUG
struct ComponentPreviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentPreviewsView()
            .previewBoth()
    }
}
#endif

//
//  PrimaryButton.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(Color.black)
                .cornerRadius(12)
        }
    }
}

#Preview {
    PrimaryButton(title: "Continue") {
        print("Button tapped")
    }
    .padding()
}


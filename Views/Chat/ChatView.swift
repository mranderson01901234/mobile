//
//  ChatView.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel: ChatViewModel
    
    init(viewModel: ChatViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Messages list
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.messages) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding()
            }
            
            // Input bar
            MessageInputBar(
                text: $viewModel.currentInput,
                onSend: {
                    Task {
                        await viewModel.sendMessage()
                    }
                }
            )
        }
        .navigationTitle(viewModel.conversation.title)
    }
}

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.role == .user {
                Spacer()
            }
            
            Text(message.content)
                .padding()
                .background(message.role == .user ? Color.gray.opacity(0.2) : Color.black)
                .foregroundColor(message.role == .user ? .black : .white)
                .cornerRadius(18)
            
            if message.role == .assistant {
                Spacer()
            }
        }
    }
}

struct MessageInputBar: View {
    @Binding var text: String
    let onSend: () -> Void
    
    var body: some View {
        HStack {
            TextField("Type a message...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: onSend) {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.title2)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        ChatView(viewModel: ChatViewModel(
            conversation: .empty,
            inferenceEngine: InferenceEngine(),
            modelManager: ModelManager()
        ))
    }
}


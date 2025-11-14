//
//  DocumentLibraryViewModel.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation
import Combine
import SwiftUI

class DocumentLibraryViewModel: ObservableObject {
    @Published var documents: [Document] = []
    @Published var searchText: String = ""
    @Published var selectedFilter: DocumentFilter = .all
    
    enum DocumentFilter {
        case all
        case pdfs
        case images
        case audio
    }
    
    func loadDocuments() {
        // TODO: Load documents from store
        documents = []
    }
    
    func uploadDocument(url: URL) async throws {
        // TODO: Implement document upload
    }
    
    func deleteDocument(_ document: Document) {
        documents.removeAll { $0.id == document.id }
        // TODO: Delete from store
    }
}


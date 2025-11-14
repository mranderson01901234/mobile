//
//  Document.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation

struct Document: Identifiable, Codable {
    let id: UUID
    var filename: String
    var fileURL: URL
    var fileType: DocumentType
    var fileSize: Int64
    var extractedText: String?
    var hasEmbedding: Bool
    var addedAt: Date
    var lastAccessedAt: Date
    var usageCount: Int
    var tags: [String]
    
    init(
        id: UUID = UUID(),
        filename: String,
        fileURL: URL,
        fileType: DocumentType,
        fileSize: Int64,
        extractedText: String? = nil,
        hasEmbedding: Bool = false,
        addedAt: Date = Date(),
        lastAccessedAt: Date = Date(),
        usageCount: Int = 0,
        tags: [String] = []
    ) {
        self.id = id
        self.filename = filename
        self.fileURL = fileURL
        self.fileType = fileType
        self.fileSize = fileSize
        self.extractedText = extractedText
        self.hasEmbedding = hasEmbedding
        self.addedAt = addedAt
        self.lastAccessedAt = lastAccessedAt
        self.usageCount = usageCount
        self.tags = tags
    }
    
    enum DocumentType: String, Codable {
        case pdf
        case image
        case text
        case audio
        case spreadsheet
        case other
    }
}


//
//  Logger.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation
import OSLog

class Logger {
    private static let subsystem = Bundle.main.bundleIdentifier ?? "com.localaiassistant"
    
    static let app = OSLog(subsystem: subsystem, category: "App")
    static let inference = OSLog(subsystem: subsystem, category: "Inference")
    static let document = OSLog(subsystem: subsystem, category: "Document")
    static let storage = OSLog(subsystem: subsystem, category: "Storage")
    static let security = OSLog(subsystem: subsystem, category: "Security")
    
    static func log(_ message: String, level: OSLogType = .default, category: OSLog = app) {
        os_log("%{public}@", log: category, type: level, message)
    }
    
    static func error(_ message: String, category: OSLog = app) {
        log(message, level: .error, category: category)
    }
    
    static func info(_ message: String, category: OSLog = app) {
        log(message, level: .info, category: category)
    }
    
    static func debug(_ message: String, category: OSLog = app) {
        log(message, level: .debug, category: category)
    }
}


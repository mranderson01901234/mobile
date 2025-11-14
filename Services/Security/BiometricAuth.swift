//
//  BiometricAuth.swift
//  iOS Local AI Assistant
//
//  Created on Phase 1 Foundation
//

import Foundation
import LocalAuthentication

class BiometricAuth {
    private let context = LAContext()
    
    func authenticate(reason: String = "Access your secure AI assistant") async throws -> Bool {
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            throw AuthError.biometricsNotAvailable
        }
        
        do {
            return try await context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: reason
            )
        } catch {
            throw AuthError.authenticationFailed
        }
    }
    
    func isBiometricsAvailable() -> Bool {
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
}

enum AuthError: Error {
    case biometricsNotAvailable
    case authenticationFailed
}


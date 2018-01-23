//
//  STError.swift
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 19/12/2017.
//

import Foundation

public enum StomtError {
    
    // Errors deriving from platform-specific implementations
    public enum PortabilityError: Error {
        case MethodNotAvailableOnOS(String, String)
    }
    
    // Errors deriving from baseAPI-specific capabilities
    public enum APIPortabilityError: Error {
        case MethodNotAvailableOnServer(String, String)
    }
    
}

public enum JSONCodableError {
    
    // Errors deriving from the decoding process
    public enum DecodeError: Error {
        case KeyNotFound(String)
        case TypeMismatch(String)
    }
    
}

// MARK: Protocol/LocalizedError - Error Descriptions

extension StomtError.APIPortabilityError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .MethodNotAvailableOnServer(let function, let environment):
            return "[Stomt/APIPortability] \(function) is not available in the \(environment) environment."
        }
    }
}

extension StomtError.PortabilityError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .MethodNotAvailableOnOS(let function, let os):
            return "[Stomt/Portability] \(function) is currently not available on \(os)."
        }
    }
}

extension JSONCodableError.DecodeError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .KeyNotFound(let key):
            return "[JSONCodable/DecodeError] Key '\(key)' not found."
        case .TypeMismatch(let key):
            return "[JSONCodable/DecodeError] Value for '\(key)' has a mismatching type."
        }
    }
}

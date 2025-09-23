//
//  RegisterResult.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 22/09/25.
//

import Foundation

public enum AuthResult: Equatable {
    case success
    case failure(AuthError)
}

public enum AuthError: Error, Equatable, CustomStringConvertible {
    case emailAlreadyInUse
    case invalidEmail
    case weakPassword
    case networkError
    case unknown(String)

    public var description: String {
        switch self {
        case .emailAlreadyInUse: return "Email is already in use."
        case .invalidEmail: return "Invalid email address."
        case .weakPassword: return "Password is too weak."
        case .networkError: return "Network error."
        case .unknown(let msg): return msg
        }
    }
}

//
//  ValidationError.swift
//  CarShopReservation
//
//  Created by Moises Gil on 12/31/25.
//
import Foundation

enum ValidationError: LocalizedError, Identifiable {
    var id: String {
        return "validation_error_\(UUID().uuidString)"
    }
    
    case emptyField(fieldName: String)
    case invalidEmail(email: String)
    case invalidPhoneNumber(phoneNumber: String)
    
    var errorDescription: String? {
        switch self {
        case .emptyField(let fieldName):
            return "Value for '\(fieldName)' cannot be empty"
        case .invalidEmail(let email):
            return "Email '\(email)' is not valid'"
        case .invalidPhoneNumber(let phoneNumber):
            return "Phone number '\(phoneNumber)' is not valid'"
        }
    }
}

//
//  ValidationResult.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/23.
//

import Foundation

enum ValidationResult: Equatable {
    case valid
    case invalid(ValidationError)
    case empty
}

struct ValidationError: Equatable, Identifiable{
    let id = UUID()
    let message: String
}

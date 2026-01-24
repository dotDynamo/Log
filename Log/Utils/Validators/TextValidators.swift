//
//  TextValidators.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/23.
//

import Foundation

struct NonEmptyValidator: FieldValidator {
    let message: String

    func validate(_ value: String) -> ValidationResult {
        value.isEmpty ? .empty : .valid
    }
}

struct IsNumberValidator: FieldValidator {
    let message: String
    
    func validate(_ value: String) -> ValidationResult {
        Int(value) == nil ? .valid : .invalid(.init(message: "The value must be an integer"))
    }
}

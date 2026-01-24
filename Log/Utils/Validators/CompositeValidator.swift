//
//  CompositeValidator.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/23.
//

import Foundation

struct CompositeValidator: FieldValidator {
    let validators: [FieldValidator]
    
    func validate(_ value: String) -> ValidationResult {
        for validator in validators {
            let result = validator.validate(value)
            if result != .valid {
                return result
            }
        }
        return .valid
    }
}

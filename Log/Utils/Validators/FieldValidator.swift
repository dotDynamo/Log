//
//  FieldValidator.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/23.
//

import Foundation


protocol FieldValidator {
    func validate(_ value: String) -> ValidationResult
}

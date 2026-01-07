//
//  User.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import Foundation
import SwiftData

@Model
class User{
    @Attribute(.unique) var id: UUID
    var username: String
    var name: String
    var paternalSurname: String
    var maternalSurname: String?
    
    init(id: UUID = UUID(), username: String, name: String, paternalSurname: String, maternalSurname: String? = nil) {
        self.id = id
        self.username = username
        self.name = name
        self.paternalSurname = paternalSurname
        self.maternalSurname = maternalSurname
    }
}

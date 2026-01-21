//
//  Achievement.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/12.
//

import Foundation
import SwiftData

@Model
class Achievement{
    @Attribute(.unique) var id: UUID
    var name: String
    var detail: String
    var isCompleted: Bool
    var date: Date
    @Relationship var game: GameLog? = nil
    
    init(id: UUID = UUID(), name: String, detail: String, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.detail = detail
        self.isCompleted = isCompleted
        self.date = Date.now
    }
}

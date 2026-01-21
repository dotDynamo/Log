//
// Run.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/07.
//

import Foundation
import SwiftData

@Model
class Run{
    @Attribute(.unique) var id: UUID
    var completedTime: Double
    var mode: String
    var achievements: Int
    var date: Date
    @Relationship var game: GameLog? = nil
    
    init(id: UUID = UUID(), completedTime: Double, mode: String, achievements: Int, date: Date) {
        self.id = id
        self.completedTime = completedTime
        self.mode = mode
        self.achievements = achievements
        self.date = date
    }
}

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
    var completedTime: Int?
    var mode: String
    var achievements: Int?
    var date: Date
    @Relationship var game: GameLog
    
    init(id: UUID = UUID(), completedTime: Int? = nil, mode: String, achievements: Int? = nil, date: Date, game: GameLog) {
        self.id = id
        self.completedTime = completedTime
        self.mode = mode
        self.achievements = achievements
        self.date = date
        self.game = game
    }
}

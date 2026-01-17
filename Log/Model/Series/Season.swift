//
//  Season.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import Foundation
import SwiftData

@Model
class Season{
    @Attribute(.unique) var id : UUID
    var number: Int
    var name: String?
    var rating: Double?
    @Relationship(deleteRule: .cascade) var episodes: [Episode] = []
    
    init(id: UUID = UUID(), number: Int, name: String? = nil, rating: Double? = nil) {
        self.id = id
        self.number = number
        self.name = name
        self.rating = rating
    }
}

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
    var rating: Double? {
        guard !episodes.isEmpty else { return  nil}
        var totalEpisodes = 0.0
        var ratingTotal = 0.0
        for episode in episodes {
            if episode.rating != nil {
                ratingTotal += episode.rating!
                totalEpisodes += 1
            }
        }
        return ratingTotal/totalEpisodes
    }
    @Relationship(deleteRule: .cascade) var episodes: [Episode] = []
    
    init(id: UUID = UUID(), number: Int, name: String? = nil) {
        self.id = id
        self.number = number
        self.name = name
    }
}

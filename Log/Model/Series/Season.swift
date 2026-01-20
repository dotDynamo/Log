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
    var name: String
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
    @Relationship() var series: SeriesLog? = nil
    @Relationship(deleteRule: .cascade) var episodes: [Episode] = []
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

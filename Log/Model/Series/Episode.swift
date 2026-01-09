//
//  Episode.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import Foundation
import SwiftData

@Model
class Episode{
    var name: String
    var rating: Double?
    var watched: Bool
    @Relationship var season: Season
    
    init(name: String, rating: Double? = nil, watched: Bool = false, season: Season) {
        self.name = name
        self.rating = rating
        self.watched = watched
        self.season = season
    }
}

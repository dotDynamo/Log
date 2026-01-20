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
    @Attribute(.unique) var id: UUID
    var name: String
    var rating: Double?
    var watched: Bool
    @Relationship var season: Season? = nil
    
    init(id: UUID = UUID(), name: String, rating: Double? = nil, watched: Bool = false) {
        self.id = id
        self.name = name
        self.rating = rating
        self.watched = watched
    }
}

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
    var number: Int
    var name: String?
    var rating: Double?
    @Relationship(deleteRule: .cascade) var episodes: [Episode] = []
    
    init(number: Int, name: String? = nil, rating: Double? = nil) {
        self.number = number
        self.name = name
        self.rating = rating
    }
}

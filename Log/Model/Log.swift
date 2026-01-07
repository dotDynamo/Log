//
//  Log.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import Foundation
import SwiftData

@Model
class Log{
    @Attribute(.unique) var id: UUID
    var title: String
    var releaseDate: Date
    var startDate: Date?
    var finishDate: Date?
    var rating: Int?
    var recommendedBy: String?
    var Notes: String?
    @Relationship var user: User
    @Relationship var tags: [Tag]
    
    init(id: UUID = UUID(), title: String, releaseDate: Date, startDate: Date? = nil, finishDate: Date? = nil, rating: Int? = nil, recommendedBy: String? = nil, Notes: String? = nil, user: User, tags: [Tag]) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.startDate = startDate
        self.finishDate = finishDate
        self.rating = rating
        self.recommendedBy = recommendedBy
        self.Notes = Notes
        self.user = user
        self.tags = tags
    }
}

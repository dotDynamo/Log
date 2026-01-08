//
//  Log.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import Foundation
import SwiftData

enum Status{
    case completed
    case inProgress
    case dropped
    case inQueue
}

@Model
class Log{
    @Attribute(.unique) var id: UUID
    var title: String
    var releaseDate: Date?
    var startDate: Date?
    var finishDate: Date?
    var rating: Int?
    var recommendedBy: String?
    var notes: String?
    var status: Status
    @Relationship var user: User
    @Relationship var tags: [Tag]
    
    init(id: UUID = UUID(), title: String, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Int? = nil, recommendedBy: String? = nil, notes: String? = nil, status: Status = .inQueue, user: User, tags: [Tag]) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.startDate = startDate
        self.finishDate = finishDate
        self.rating = rating
        self.recommendedBy = recommendedBy
        self.notes = notes
        self.status = status
        self.user = user
        self.tags = tags
    }
}

//
//  Log.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import Foundation
import SwiftData

enum Status: String, Codable{
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
    
    init(id: UUID = UUID(), title: String, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Int? = nil, recommendedBy: String? = nil, notes: String? = nil, status: Status = Status.inQueue, user: User, tags: [Tag] = []) {
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

@available(iOS 26.0, *)
@Model
class MusicLog: Log{
    var artist: String
    var album: String?
    var isFullAlbum: Bool
    
    init(title: String, user: User, artist: String, album: String? = nil, isFullAlbum: Bool) {
        self.artist = artist
        self.album = album
        self.isFullAlbum = isFullAlbum
        super.init(title: title, user: user)
    }
}

@available(iOS 26.0, *)
@Model
class MovieLog: Log{
    var director: String
    var writer: String
    
    init(title: String, user: User, director: String, writer: String) {
        self.director = director
        self.writer = writer
        super.init(title: title, user: user)
    }
}

@available(iOS 26.0, *)
@Model
class SeriesLog: Log{
    var creator: String
    var studio: String?
    
    init(title: String, user: User, creator: String, studio: String? = nil) {
        self.creator = creator
        self.studio = studio
        super.init(title: title, user: user)
    }
}

@available(iOS 26.0, *)
@Model
class BookLog: Log{
    var author: String
    var isbn: String
    
    init(title: String, user: User, author: String, isbn: String) {
        self.author = author
        self.isbn = isbn
        super.init(title: title, user: user)
    }
}

@available(iOS 26.0, *)
@Model
class GameLog: Log{
    var creator: String?
    var gameStudio: String
    var platform: String
    var totalAchievements: Int?
    var run: Run
    
    init(title: String, user: User, creator: String? = nil, gameStudio: String, platform: String, totalAchievements: Int? = nil, run: Run) {
        self.creator = creator
        self.gameStudio = gameStudio
        self.platform = platform
        self.totalAchievements = totalAchievements
        self.run = run
        super.init(title: title, user: user)
    }
}


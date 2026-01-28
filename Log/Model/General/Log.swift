//
//  Log.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/06.
//

import Foundation
import SwiftData

enum LogCategory: String, Codable{
    case movie
    case series
    case music
    case book
    case game
}

enum Status: String, Codable{
    case completed
    case inProgress
    case dropped
    case inQueue
}

enum ReleaseType: String, Codable{
    case single = "Single"
    case album = "Album"
    case EP = "EP"
}

@Model
class Log{
    @Attribute(.unique) var id: UUID = UUID()
    var category: LogCategory
    var title: String
    var releaseDate: Date
    var sameDate: Bool
    var startDate: Date?
    var finishDate: Date?
    var rating: Double?
    var recommendedBy: String?
    var notes: String?
    var status: Status
    @Relationship var user: User
    @Relationship var tags: [Tag] = []
    
    @Relationship(deleteRule: .cascade) var movie: MovieLog?
    @Relationship(deleteRule: .cascade) var series: SeriesLog?
    @Relationship(deleteRule: .cascade) var music: MusicLog?
    @Relationship(deleteRule: .cascade) var book: BookLog?
    @Relationship(deleteRule: .cascade) var game: GameLog?
    
    init(category: LogCategory, title: String, releaseDate: Date, sameDate: Bool, startDate: Date? = nil, finishDate: Date? = nil, rating: Double? = nil, recommendedBy: String? = nil, notes: String? = nil, status: Status, user: User) {
        self.category = category
        self.title = title
        self.releaseDate = releaseDate
        self.sameDate = sameDate
        self.startDate = startDate
        self.finishDate = finishDate
        self.rating = rating
        self.recommendedBy = recommendedBy
        self.notes = notes
        self.status = status
        self.user = user
    }
}

@Model
class MovieLog{
    var director: String
    var writer: String
    var runningTime: Int
    
    init(director: String, writer: String, runningTime: Int) {
        self.director = director
        self.writer = writer
        self.runningTime = runningTime
    }
}

@Model
class SeriesLog{
    var creator: String
    var studio: String?
    @Relationship(deleteRule: .cascade) var seasons: [Season]
    
    init(creator: String, studio: String? = nil, seasons: [Season]) {
        self.creator = creator
        self.studio = studio
        self.seasons = seasons
    }
}

@Model
class MusicLog{
    var artist: String
    var album: String?
    var releaseType: ReleaseType
    @Relationship(deleteRule: .cascade) var tracklist: [Song] = []
    
    init(artist: String, album: String? = nil, releaseType: ReleaseType = .single, tracklist: [Song]) {
        self.artist = artist
        self.album = album
        self.releaseType = releaseType
        self.tracklist = tracklist
    }
}

@Model
class BookLog{
    var author: String
    var isbn: String?
    
    init(author: String, isbn: String? = nil) {
        self.author = author
        self.isbn = isbn
    }
}

@Model
class GameLog{
    var creator: String?
    var gameStudio: String
    var platform: String
    @Relationship(deleteRule: .cascade)var runs: [Run] = []
    @Relationship(deleteRule: .cascade)var achievements: [Achievement] = []
    
    
    init(creator: String? = nil, gameStudio: String, platform: String, runs: [Run], achievements: [Achievement]) {
        self.creator = creator
        self.gameStudio = gameStudio
        self.platform = platform
        self.runs = runs
        self.achievements = achievements
    }
}


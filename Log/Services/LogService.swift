//
//  LogService.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
struct LogService{
    let modelContext: ModelContext
    
    func addMovieLog(title: String, director: String, writer: String, runningTime: Int, status: Status, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Double? = nil, recommendedBy: String, notes: String, user: User){
        
        let newLog = Log(category: .movie, title: title, releaseDate: releaseDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, status: status, user: user)
        newLog.movie = MovieLog(director: director, writer: writer, runningTime: runningTime)
        modelContext.insert(newLog)
        try? modelContext.save()
    }
    
    func addSeriesLog(title: String, creator: String, studio: String, seasons: [Season], runningTime: Int, status: Status, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Double? = nil, recommendedBy: String, notes: String, user: User){
        
        let newLog = Log(category: .series, title: title, releaseDate: releaseDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, status: status, user: user)
        newLog.series = SeriesLog(creator: creator, studio: studio, seasons: seasons)
        modelContext.insert(newLog)
        try? modelContext.save()
    }
    
    func addMusicLog(title: String, artist: String, album: String, releaseType: ReleaseType, tracklist: [Song], status: Status, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Double? = nil, recommendedBy: String, notes: String, user: User){
        
        let newLog = Log(category: .music, title: title, releaseDate: releaseDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, status: status, user: user)
        newLog.music = MusicLog(artist: artist, album: album, releaseType: releaseType, tracklist: tracklist)
        modelContext.insert(newLog)
        try? modelContext.save()
    }
    
    func addBookLog(title: String, author: String, isbn: String, status: Status, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Double? = nil, recommendedBy: String, notes: String, user: User){
        
        let newLog = Log(category: .book, title: title, releaseDate: releaseDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, status: status, user: user)
        newLog.book = BookLog(author: author, isbn: isbn)
        modelContext.insert(newLog)
        try? modelContext.save()
    }
    
    func addGameLog(title: String, creator: String, gameStudio: String, platform: String, runs: [Run], achievements: [Achievement], status: Status, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Double? = nil, recommendedBy: String, notes: String, user: User){
        
        let newLog = Log(category: .game, title: title, releaseDate: releaseDate, startDate: startDate, finishDate: finishDate, rating: rating, recommendedBy: recommendedBy, notes: notes, status: status, user: user)
        newLog.game = GameLog(creator: creator, gameStudio: gameStudio, platform: platform, runs: runs, achievements: achievements)
        modelContext.insert(newLog)
        try? modelContext.save()
    }
    
}

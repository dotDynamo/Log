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
    
    func addMovieLog(title: String, director: String, writer: String, runningTime: Int, status: Status, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Double? = nil, recommendedBy: String? = nil, notes: String? = nil, user: User){
        
        let newMovieLog = MovieLog(title: title, releaseDate: releaseDate, startDate: startDate, finishDate: finishDate, rating: rating,
                                   recommendedBy: recommendedBy!.isEmpty ? nil : recommendedBy,
                                   notes: notes!.isEmpty ? nil : notes, status: status, user: user, director: director, writer: writer, runningTime: runningTime)
        modelContext.insert(newMovieLog)
        try? modelContext.save()
    }
    
    func addSeriesLog(){
        
    }
    
    func addMusicLog(title: String, artist: String, releaseType: ReleaseType, satus: Status, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, ){
        
    }
    
    func addBookLog(){
        
    }
    
    func addGameLog(){
        
    }
    
}

/*
, rating: Double? = nil, recommendedBy: String? = nil, notes: String? = nil, status: Status = Status.inQueue, user: User, artist: String, album: String? = nil, releaseType: ReleaseType = .single


title: String, releaseDate: Date? = nil, startDate: Date? = nil, finishDate: Date? = nil, rating: Double? = nil, recommendedBy: String? = nil, notes: String? = nil, status: Status = Status.inQueue, user: User, director: String, writer: String, runningTime: Int
*/

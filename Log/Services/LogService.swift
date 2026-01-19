//
//  LogService.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/17.
//

import Foundation
import SwiftData

@MainActor
struct LogService{
    let modelContext: ModelContext
    
    func addMovieLog(){
        
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
 */

//
//  LogUtils.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/07.
//

import Foundation

struct LogUtils{
    
    static func ratingToText(rating: Double?) -> String{
        if rating == 10{
            return "10/10"
        }
        return "\(rating, default: "- ")/10"
    }
    
    static func statusToText(log: Log) -> String{
        switch(log.status){
        case .completed:
            return "Completed"
        case .dropped:
            return "Dropped"
        case .inProgress:
            if log is MusicLog {
                return "Listening"
            } else if log is MovieLog  {
                return "Watching"
            } else if log is SeriesLog {
                return "Watching"
            } else if log is BookLog {
                return "Reading"
            } else {
                return "Playing"
            }
        case .inQueue:
            if log is MusicLog {
                return "Listenlist"
            } else if log is MovieLog {
                return "Watchlist"
            } else if log is SeriesLog {
                return "Watchlist"
            } else if log is BookLog {
                return "Readlist"
            } else {
                return "Backlog"
            }
        }
    }
}

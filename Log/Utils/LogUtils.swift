//
//  LogUtils.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/07.
//

import Foundation

struct LogUtils{
    
    static func ratingToText(rating: Double?, style: RatingStyle) -> String{
        switch(style){
        case .round:
            if rating == nil {
                return "-"
            }
            if rating == 10{
                return "10"
            }
            return "\(round(rating! * 10)/10)"
        case .capsule:
            if rating == nil {
                return "- /10"
            }
            if rating == 10{
                return "10/10"
            }
            return "\(round(rating! * 10)/10)/10"
        }
    }
    
    static func statusToText(log: Log) -> String{
        switch(log.status){
        case .completed:
            return "Completed"
        case .dropped:
            return "Dropped"
        case .inProgress:
            if log.category == .music {
                return "Listening"
            } else if log.category == .movie || log.category == .series {
                return "Watching"
            } else if log.category == .book {
                return "Reading"
            } else {
                return "Playing"
            }
        case .inQueue:
            if log.category == .music {
                return "To listen"
            } else if log.category == .movie || log.category == .series {
                return "Watchlist"
            } else if log.category == .book {
                return "To read"
            } else {
                return "Backlog"
            }
        }
    }
    
    static func addStatusToText(status: Status, category: LogCategory) -> String{
        switch(status){
        case .completed, .dropped:
            return ""
        case .inProgress:
            switch(category){
            case .book:
                return "Reading"
            case .game:
                return "Playing"
            case .movie, .series:
                return "Watching"
            case .music:
                return "Listening"
            }
        case .inQueue:
            switch(category){
            case .book:
                return "To read"
            case .game:
                return "Backlog"
            case .movie, .series:
                return "Watchlist"
            case .music:
                return "To listen"
            }
        }
    }
    
    static func getSeriesRating(_ log: SeriesLog) -> Double?{
        var totalRating = 0.0
        for season in log.seasons{
            if season.rating != nil{ totalRating += season.rating!}
        }
        if totalRating == 0.0{ return nil}
        return totalRating/Double(log.seasons.count)
    }
}

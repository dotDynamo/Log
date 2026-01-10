//
//  LogUtils.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/07.
//

import Foundation

struct LogUtils{
    
    static func ratingToText(rating: Double?, style: Style) -> String{
        switch(style){
        case .round:
            if rating == 10{
                return "10"
            }
            return "\(rating, default: "-")"
        case .capsule:
            if rating == 10{
                return "10/10"
            }
            return "\(rating, default: "- ")/10"
        }
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
    
    static func getFromDate(_ date: Date?, get dateSection: Date.FormatStyle = .dateTime) -> String{
        if date != nil {
            return date!.formatted(dateSection)
        }
        return ""
    }
    
    static func compareDate(from startDate: Date, to endDate: Date, component: Calendar.Component = .day) -> Int?{
        switch(component){
        case .day:
            return Calendar.current.dateComponents([.day], from: startDate, to: endDate).day
        case .month:
            return Calendar.current.dateComponents([.month], from: startDate, to: endDate).month
        case .year:
            return Calendar.current.dateComponents([.year], from: startDate, to: endDate).year
        default:
            return nil
        }
    }
}

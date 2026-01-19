//
//  TimeUtils.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import Foundation


struct TimeUtils{
    
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
    
    static func secondsToHMS(_ seconds: Int) -> String {
        let hours: Int = seconds/3600
        let minutes: Int = (seconds - (hours * 3600))/60
        let seconds: Int = seconds - (minutes * 60) - (hours * 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    static func secondsToMinSec(_ seconds: Int) -> String {
        let minutes: Int = seconds/60
        let seconds: Int = seconds - (minutes * 60)
        return String(format: "%d:%02d", minutes, seconds)
    }
    
}

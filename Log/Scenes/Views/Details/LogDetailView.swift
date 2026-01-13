//
//  LogDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct LogDetailView: View {
    let log: Log
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    if log.releaseDate != nil {
                        Text(LogUtils.getFromDate(log.releaseDate, get: .dateTime.year()))
                    }
                    Text(log.title).font(.title).bold()
                }
                Spacer()
                RatingView(rating: log.rating, size: .large, style: .round)
            }
            Divider()
            switch log{
            case is MusicLog:
                MusicDetailView(log: log as! MusicLog)
            case is MovieLog:
                MovieDetailView(log: log as! MovieLog)
            case is SeriesLog:
                SeriesDetailView(log: log as! SeriesLog)
            case is BookLog:
                BookDetailView(log: log as! BookLog)
            case is GameLog:
                GameDetailView(log: log as! GameLog)
            default:
                Text("Some error ocurred")
            }
            DatePeriodView(startDate: log.startDate, finishDate: log.finishDate)
            if log.recommendedBy != nil {
                Divider()
                Text("Recommended by:").font(.headline).foregroundStyle(.gray)
                Text(log.recommendedBy!)
            }
            if log.notes != nil {
                Divider()
                Text("Notes:").font(.headline).foregroundStyle(.gray)
                Text(log.notes!)
            }
            Divider()
            TagView(tags: log.tags)
            Spacer()
        }
        .padding()
        .navigationTitle("Log")
        .toolbar(){
            Button(action: stub){
                Label("Edit", systemImage: "square.and.pencil").labelStyle(.iconOnly)
            }
        }
    }
    
    func stub(){
        print("Edit button")
    }
}

#Preview {
    let user: User = User(username: "diego", name: "Diego", paternalSurname: "Herrera")
    let log: Log = GameLog(title: "Hollow Knight", releaseDate: Date.now,
                           startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 8)), finishDate: Date.now,
                           rating: 9.3, recommendedBy: "Friends name",
                           notes: "Sección de notas",
                           status: .completed, user: user,
                           gameStudio: "Team Cherry", platform: "Nintendo Switch")
    LogDetailView(log: log)
}

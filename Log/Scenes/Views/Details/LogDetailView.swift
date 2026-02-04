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
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading){
                        Text(TimeUtils.getFromDate(log.releaseDate, get: .dateTime.year()))
                        Text(log.title).font(.title).bold()
                    }
                    Spacer()
                    RatingView(rating: log.rating, size: .large, style: .round)
                }
                Divider()
                switch log.category{
                case .movie:
                    MovieDetailView(log: log)
                case .series:
                    SeriesDetailView(log: log)
                case .music:
                    MusicDetailView(log: log)
                case .book:
                    BookDetailView(log: log)
                case .game:
                    GameDetailView(log: log)
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

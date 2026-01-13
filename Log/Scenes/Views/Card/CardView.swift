//
//  CardView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/07.
//

import SwiftUI

struct CardView: View {
    let log: Log
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            CommonCardSection(log: log)
            switch log{
            case is MusicLog:
                MusicCardSection(log: log as! MusicLog)
            case is MovieLog:
                MovieCardSection(log: log as! MovieLog)
            case is SeriesLog:
                SeriesCardSection(log: log as! SeriesLog)
            case is BookLog:
                BookCardSection(log: log as! BookLog)
            case is GameLog:
                GameCardSection(log: log as! GameLog)
            default:
                Text("Some error ocurred")
            }
            HStack{
                TagView(tags: log.tags)
                Spacer()
                RatingView(rating: log.rating)
            }
        }
    }
}

#Preview {
    let user = User(username: "Webardo", name: "Diego", paternalSurname: "Herrera")
    let log = MovieLog(title: "Alien", releaseDate: Date.now, rating: 9.3, status: .completed, user: user, director: "Ridley Scott", writer: "Dan O'Bannon", runningTime: 116)
    CardView(log: log)
}

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
        HStack{
            VStack(alignment: .leading, spacing: 0){
                CommonCardSection(log: log)
                switch log.category {
                case .movie:
                    MovieCardSection(log: log)
                case .series:
                    SeriesCardSection(log: log)
                case .music:
                    MusicCardSection(log: log)
                case .book:
                    BookCardSection(log: log)
                case .game:
                    GameCardSection(log: log)
                }
            }
            Spacer()
            RatingView(rating: log.rating)
        }
        TagView(tags: log.tags)
    }
}

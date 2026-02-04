//
//  SeasonView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/16.
//

import SwiftUI

struct SeasonView: View {
    let season: Season
    let number: Int
    
    @State var collapse: Bool = true
    var body: some View {
        HStack{
            if season.name != ""{
                Text(season.name)
            }else {
                Label("Season \(number)", systemImage: collapse ? "chevron.right" : "chevron.down")
                    .onTapGesture {
                        collapse.toggle()
                    }
            }
            RatingView(rating: season.rating, size: .small, style: .capsule)
        }
        if !collapse{
            ForEach(season.episodes){ episode in
                EpisodeView(episode: episode)
            }
        }
    }
    
    func getSeasonRating(){
        
    }
}

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
    var body: some View {
        HStack{
            if season.name != ""{
                Text(season.name)
            }else {
                Text("Season \(number)")
            }
            RatingView(rating: season.rating, size: .small, style: .capsule)
        }
        ForEach(season.episodes){ episode in
            EpisodeView(episode: episode)
        }
    }
    
    func getSeasonRating(){
        
    }
}

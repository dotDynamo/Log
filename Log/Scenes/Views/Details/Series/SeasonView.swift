//
//  SeasonView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/16.
//

import SwiftUI

struct SeasonView: View {
    let season: Season
    var body: some View {
        HStack{
            if season.name != nil{
                Text(season.name!)
            }else {
                Text("Season \(season.number)")
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

//
//  AddEpisodesView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/19.
//

import SwiftUI

struct AddEpisodesView: View {
    @Binding var season: Season
    
    var body: some View {
        List{
            Section(){
                ForEach($season.episodes){ $episode in
                    HStack{
                        Text(String((season.episodes.firstIndex(of: episode) ?? 0) + 1))
                        TextField("Episode name", text: $episode.name)
                        Button("", systemImage: episode.watched ? "checkmark.circle.fill" : "checkmark.circle", action: { episode.watched.toggle() })
                        if episode.watched {
                            RatingPicker(rating: $episode.rating)
                        }
                    }
                }
                Button(action: addEpisode){
                    Label("Add Episode", systemImage: "plus")
                }
            }
        }
        
    }
    
    func addEpisode(){
        let newEpisode = Episode(name: "", watched: false)
        season.episodes.append(newEpisode)
    }
}

//
//  MusicDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct MusicDetailView: View {
    let log: MusicLog
    var body: some View {
        switch(log.releaseType){
        case .single, .EP:
            Text(log.artist)
            if log.album != nil {
                Text(log.album!)
            }
        case .album:
            Text(log.artist)
        }
        
        Divider()
        if log.releaseType != .single {
            Text("Tracklist").font(.headline).foregroundStyle(.gray)
            VStack{
                ForEach(log.trackList){ song in
                    HStack{
                        SongView(song: song)
                    }.padding()
                    Divider()
                }
            }
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

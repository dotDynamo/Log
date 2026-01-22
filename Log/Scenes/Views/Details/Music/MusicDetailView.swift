//
//  MusicDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct MusicDetailView: View {
    let log: Log
    var body: some View {
        switch(log.music!.releaseType){
        case .single, .EP:
            Text(log.music!.artist)
            if log.music!.album != nil {
                Text(log.music!.album!)
            }
        case .album:
            Text(log.music!.artist)
        }
        
        Divider()
        if log.music!.releaseType != .single {
            Text("Tracklist").font(.headline).foregroundStyle(.gray)
            VStack{
                ForEach(log.music!.trackList){ song in
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

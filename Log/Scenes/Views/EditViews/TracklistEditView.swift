//
//  TracklistEditView.swift
//  Log
//
//  Created by Diego Herrera on 2026/02/12.
//

import SwiftUI

struct TracklistEditView: View {
    
    @Binding var tracklist: [Song]
    
    var body: some View {
        Section("Trakclist"){
            ForEach($tracklist) { $song in
                HStack {
                    TextField("Song Title", text: $song.name)
                    MinSecPicker(duration: $song.duration)
                }
            }
            .onDelete { indexSet in
                tracklist.remove(atOffsets: indexSet)
            }
            Button(action: addSongToTracklist) {
                Label("Add Song", systemImage: "plus")
            }
        }
    }
    
    func addSongToTracklist(){
        
    }
}

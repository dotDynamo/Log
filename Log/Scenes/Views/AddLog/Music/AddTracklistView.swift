//
//  AddTracklistView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct AddTracklistView: View {
    @Binding var songs: [Song]
    @State var songDuration: Int = 0
    var body: some View {
        Section("Tracks") {
            ForEach($songs) { $song in
                HStack {
                    TextField("Song Title", text: $song.name)
                    MinSecPicker(duration: $songDuration)
                }
            }
            .onDelete { indexSet in
                songs.remove(atOffsets: indexSet)
            }
            Button(action: addSongToList) {
                Label("Add Song", systemImage: "plus")
            }
        }
    }
    
    func addSongToList(){
        let newSong = Song(name: "", duration: 0)
        songs.append(newSong)
    }
}

#Preview {
    @Previewable @State var songs = [Song(name: "Párteme la Cara", duration: 168), Song(name: "Demasiadas mujeres", duration: 154)]
    @Previewable @State var songs2:[Song] = [Song(name:"", duration: 0)]
    List{
        AddTracklistView(songs: $songs2)
    }
}

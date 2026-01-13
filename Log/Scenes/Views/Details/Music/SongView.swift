//
//  SongView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/12.
//

import SwiftUI

struct SongView: View {
    var song: Song
    var body: some View {
        HStack{
            Text(song.name)
            Spacer()
            Text(LogUtils.secondsToMinSec(song.duration))
            Label("", systemImage: song.isSaved ? "star.filled" : "star")
        }
    }
}

#Preview {
    let log: MusicLog = MusicLog(title: "Fower Boy", user: User(username: "", name: "", paternalSurname: ""), artist: "Tyler, The Creator")
    SongView(song: Song(name: "See You Again (feat. Kali Uchis)", duration: 179, album: log))
}

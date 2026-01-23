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
            Text(TimeUtils.secondsToMinSec(song.duration))
            Label("", systemImage: song.isSaved ? "star.filled" : "star")
        }
    }
}

//
//  AddMusicSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct AddMusicSection: View {
    @Binding var artist: String
    @Binding var album: String
    @Binding var releaseType: ReleaseType
    var body: some View {
        TextField("Artist", text: $artist)
        HStack{
            Text("Release type")
            Picker("ReleaseType", selection: $releaseType){
                Text("Single").tag(ReleaseType.single)
                Text("Album").tag(ReleaseType.album)
                Text("EP").tag(ReleaseType.EP)
            }
        }
        if releaseType == .album || releaseType == .EP {
            TextField("Album", text: $album)
        }
    }
}

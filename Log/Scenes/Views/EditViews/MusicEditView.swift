//
//  MusicEditVIew.swift
//  Log
//
//  Created by Diego Herrera on 2026/02/10.
//

import SwiftUI

struct MusicEditView: View {
    
    @Binding var data: MusicLog
    
    var body: some View {
        TextField("Artist", text: $data.artist)
        if data.releaseType == .single{
            TextField("Album", text: Binding(
                get: { data.album! },
                set: { data.album = $0 }
            ))
        }
        Picker("ReleaseType", selection: $data.releaseType){
            Text("Single").tag(ReleaseType.single)
            Text("Album").tag(ReleaseType.album)
            Text("EP").tag(ReleaseType.EP)
        }
    }
}

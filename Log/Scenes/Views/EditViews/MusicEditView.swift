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
        
    }
}

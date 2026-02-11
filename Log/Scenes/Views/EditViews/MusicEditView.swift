//
//  MusicEditVIew.swift
//  Log
//
//  Created by Diego Herrera on 2026/02/10.
//

import SwiftUI

struct MusicEditView: View {
    
    @Binding var data: Log
    
    var body: some View {
        Text(data.music!.artist)
        
    }
}

//
//  AddGameSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct AddGameSection: View {
    @Binding var creator: String
    @Binding var studio: String
    @Binding var platform: String
    
    var body: some View {
        TextField("Creator", text: $creator)
        TextField("studio", text: $studio)
        TextField("platform", text: $platform)
    }
}

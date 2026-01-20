//
//  AddSeriesSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/18.
//

import SwiftUI

struct AddSeriesSection: View {
    @Binding var creator: String
    @Binding var studio: String
    
    var body: some View {
        TextField("Creator", text: $creator)
        TextField("Studio", text: $studio)
    }
}

/*
  creator
  studio
  seasons
    episodes
 */

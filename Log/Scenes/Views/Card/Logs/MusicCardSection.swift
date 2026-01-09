//
//  MusicCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct MusicCardSection: View {
    let log: MusicLog
    var body: some View {
        HStack{
            Text(log.artist)
            Text(log.releaseType.rawValue)
            if log.releaseDate != nil {
                Text(log.releaseDate!.formatted(.dateTime.year()))
                    .foregroundStyle(.gray)
            }
        }
    }
}

//
//  MusicCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct MusicCardSection: View {
    let log: Log
    var body: some View {
        HStack{
            Text(log.music!.artist)
            if log.releaseDate != nil {
                Text(TimeUtils.getFromDate(log.releaseDate, get: .dateTime.year())).foregroundStyle(.gray)
            }
            Text(log.music!.releaseType.rawValue).font(.caption)
        }
    }
}

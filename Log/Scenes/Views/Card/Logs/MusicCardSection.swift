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
            if log.releaseDate != nil {
                Text(TimeUtils.getFromDate(log.releaseDate, get: .dateTime.year())).foregroundStyle(.gray)
            }
            Text(log.releaseType.rawValue).font(.caption)
        }
    }
}

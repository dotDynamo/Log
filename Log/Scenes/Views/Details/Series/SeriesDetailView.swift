//
//  SeriesDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct SeriesDetailView: View {
    let log: SeriesLog
    var body: some View {
        Text("Creator").font(.headline).foregroundStyle(.gray)
        Text(log.creator)
        if log.studio != nil {
            Text("Studio").font(.headline).foregroundStyle(.gray)
            Text(log.studio!)
        }
        Divider()
        let seasonNumber = log.seasons.count
        Text(seasonNumber == 1 ? "1 Season" : "\(seasonNumber) Seasons")
        ForEach(log.seasons){ season in
            SeasonView(season: season, number: log.seasons.firstIndex(of: season)! + 1)
        }
    }
}

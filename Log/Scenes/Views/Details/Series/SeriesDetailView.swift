//
//  SeriesDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct SeriesDetailView: View {
    let log: Log
    var body: some View {
        Text("Creator").font(.headline).foregroundStyle(.gray)
        Text(log.series!.creator)
        if log.series!.studio != nil {
            Text("Studio").font(.headline).foregroundStyle(.gray)
            Text(log.series!.studio!)
        }
        Divider()
        let seasonNumber = log.series!.seasons.count
        Text(seasonNumber == 1 ? "1 Season" : "\(seasonNumber) Seasons")
        ForEach(log.series!.seasons){ season in
            SeasonView(season: season, number: log.series!.seasons.firstIndex(of: season)! + 1)
        }
    }
}

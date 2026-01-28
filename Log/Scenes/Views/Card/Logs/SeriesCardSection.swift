//
//  SeriesCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct SeriesCardSection: View {
    let log: Log
    var body: some View {
        HStack{
            if log.series!.studio != nil {
                Text(log.series!.studio!)
            }
            Text(TimeUtils.getFromDate(log.releaseDate, get: .dateTime.year())).foregroundStyle(.gray)
            if log.series!.seasons.count == 1{
                Text(String(log.series!.seasons.count)+" season").font(.caption)
            } else {
                Text(String(log.series!.seasons.count)+" seasons").font(.caption)
            }
        }
    }
}

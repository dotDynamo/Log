//
//  SeriesCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct SeriesCardSection: View {
    let log: SeriesLog
    var body: some View {
        HStack{
            if log.studio != nil {
                Text(log.studio!)
            }
            if log.seasons.count == 1{
                Text(String(log.seasons.count)+" season")
            } else {
                Text(String(log.seasons.count)+" seasons")
            }
            if log.releaseDate != nil {
                Text(LogUtils.getFromDate(log.releaseDate, get: .dateTime.year())).foregroundStyle(.gray)
            }
        }
    }
}

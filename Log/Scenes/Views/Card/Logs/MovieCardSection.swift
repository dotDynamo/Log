//
//  MovieCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct MovieCardSection: View {
    let log: Log
    var body: some View {
        HStack{
            Text(log.movie!.director)
            if log.releaseDate != nil {
                Text(TimeUtils.getFromDate(log.releaseDate, get: .dateTime.year())).foregroundStyle(.gray)
            }
        }
    }
}

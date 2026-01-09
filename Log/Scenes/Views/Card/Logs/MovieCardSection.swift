//
//  MovieCardSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI

struct MovieCardSection: View {
    let log: MovieLog
    var body: some View {
        HStack{
            Text(log.director)
            if log.releaseDate != nil {
                Text(log.releaseDate!.formatted(.dateTime.year()))
                    .foregroundStyle(.gray)
            }
        }
    }
}

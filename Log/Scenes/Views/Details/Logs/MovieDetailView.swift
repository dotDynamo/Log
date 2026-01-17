//
//  MovieDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct MovieDetailView: View {
    let log: MovieLog
    var body: some View {
        if log.director == log.writer {
            Text("Written and directed by").font(.headline).foregroundStyle(.gray)
            Text(log.director)
        } else  {
            Text("Directed by").font(.headline).foregroundStyle(.gray)
            Text(log.director)
            Text("Written by").font(.headline).foregroundStyle(.gray)
            Text(log.writer)
        }
        Text("Runtime").font(.headline).foregroundStyle(.gray)
        Text("\(log.runningTime) mins.")
    }
}

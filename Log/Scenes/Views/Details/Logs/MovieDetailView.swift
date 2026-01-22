//
//  MovieDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct MovieDetailView: View {
    let log: Log
    var body: some View {
        if log.movie!.director == log.movie!.writer {
            Text("Written and directed by").font(.headline).foregroundStyle(.gray)
            Text(log.movie!.director)
        } else  {
            Text("Directed by").font(.headline).foregroundStyle(.gray)
            Text(log.movie!.director)
            Text("Written by").font(.headline).foregroundStyle(.gray)
            Text(log.movie!.writer)
        }
        Text("Runtime").font(.headline).foregroundStyle(.gray)
        Text("\(log.movie!.runningTime) mins.")
    }
}

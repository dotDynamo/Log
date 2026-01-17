//
//  EpisodeView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/16.
//

import SwiftUI

struct EpisodeView: View {
    let episode: Episode
    var body: some View {
        HStack{
            Text(episode.name).foregroundStyle(episode.watched ? .gray : .primary)
            Spacer()
            Text(episode.rating != nil ? "\(episode.rating!)" : " - " )
        }
    }
}

//
//  ItemTypeView.swift
//  Log
//
//  Created by Diego Herrera on 2026/02/10.
//

import SwiftUI

struct ItemTypeView: View {
    let log: Log
    var body: some View {
        HStack{
            switch log.category {
            case .movie:
                Label("Movie", systemImage: "popcorn.fill")
            case .series:
                Label("Movie", systemImage: "tv.fill")
            case .music:
                Label("\(log.music!.releaseType)", systemImage: "music.note")
            case .book:
                Label("Book", systemImage: "book.fill")
            case .game:
                Label("Game", systemImage: "gamecontroller.fill")
            }
            Spacer()
        }
    }
}

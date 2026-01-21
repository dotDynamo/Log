//
//  GameDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct GameDetailView: View {
    let log: GameLog
    var body: some View {
        Text(log.gameStudio).bold()
        if log.creator != nil{
            Text(log.creator!)
        }
        Text(log.platform)
        if log.releaseDate != nil {
            Divider()
            Text("Release date:").font(.headline).foregroundStyle(.gray)
            Text(log.releaseDate!, format: .dateTime.year().month().day())
        }
        if log.achievements.count != 0 {
            Divider()
            AchievementView(achievements: log.achievements)
        }
        RunView(runs: log.runs)
    }
}

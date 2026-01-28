//
//  GameDetailView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/09.
//

import SwiftUI

struct GameDetailView: View {
    let log: Log
    var body: some View {
        Text(log.game!.gameStudio).bold()
        if log.game!.creator != nil{
            Text(log.game!.creator!)
        }
        Text(log.game!.platform)
        Divider()
        Text("Release date:").font(.headline).foregroundStyle(.gray)
        Text(log.releaseDate, format: .dateTime.year().month().day())
        if log.game!.achievements.count != 0 {
            Divider()
            AchievementView(achievements: log.game!.achievements)
        }
        RunView(runs: log.game!.runs)
    }
}

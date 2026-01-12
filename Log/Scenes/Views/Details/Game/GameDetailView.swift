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
        Text(log.gameStudio)
        if log.creator != nil{
            Text(log.creator!)
        }
        Text(log.platform)
        if log.totalAchievements != nil {
            AchievementView(achievementCount: log.totalAchievements!, achievements: log.achievements)
        }
        
        Text("Runs")
        RunView(runs: log.runs)
    }
}

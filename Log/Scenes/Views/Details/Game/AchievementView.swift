//
//  AchievementView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/12.
//

import SwiftUI

struct AchievementView: View {
    var achievementCount: Int
    var achievements: [Achievement]
    var body: some View {
        VStack(alignment: .leading){
            Label("\(countCompletedAchievements()) / \(achievementCount)", systemImage: "trophy.circle")
            ForEach(achievements){achievement in
                Text(achievement.name).foregroundStyle(achievement.isCompleted ? .white : .gray)
                if achievement.isCompleted && achievement.detail != nil {
                    Text(achievement.detail!).font(.caption)
                }
            }
        }
    }
    
    func countCompletedAchievements() -> Int {
        var count = 0
        for achievement in achievements{
            if achievement.isCompleted {
                count += 1
            }
        }
        return count
    }
}

#Preview {
    let user = User(username: "Diego", name: "Diego", paternalSurname: "Herrera")
    let game = GameLog(title: "KH", user: user, gameStudio: "Team Cherry", platform: "Xbox Series X")
    let ach1 = Achievement(name: "Episodio 1", detail: "Whoaaaa this is an avhievemet", isCompleted: true, game: game)
    let ach2 = Achievement(name: "Episodio 2", detail: "This is the second achievement", isCompleted: true, game: game)
    let ach3 = Achievement(name: "Episodio 3", game: game)
    let ach4 = Achievement(name: "Episodio 4", game: game)
    let ach5 = Achievement(name: "Episodio 5", game: game)
    let list = [ach1, ach2, ach3, ach4, ach5]
    AchievementView(achievementCount: list.count, achievements: list)
}

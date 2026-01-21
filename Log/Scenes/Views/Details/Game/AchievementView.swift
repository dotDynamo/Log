//
//  AchievementView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/12.
//

import SwiftUI

struct AchievementView: View {
    var achievements: [Achievement]
    var body: some View {
        VStack(alignment: .leading){
            Label("\(countCompletedAchievements()) / \(achievements.count)", systemImage: "trophy.circle")
            ForEach(achievements){achievement in
                Text(achievement.name).foregroundStyle(achievement.isCompleted ? .white : .gray)
                if achievement.isCompleted && !achievement.detail.isEmpty {
                    Text(achievement.detail).font(.caption)
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
    let ach1 = Achievement(name: "Episodio 1", detail: "Whoaaaa this is an avhievemet", isCompleted: true)
    let ach2 = Achievement(name: "Episodio 2", detail: "This is the second achievement", isCompleted: true)
    let ach3 = Achievement(name: "Episodio 3", detail: "")
    let ach4 = Achievement(name: "Episodio 4", detail: "")
    let ach5 = Achievement(name: "Episodio 5", detail: "")
    let list = [ach1, ach2, ach3, ach4, ach5]
    AchievementView(achievements: list)
}

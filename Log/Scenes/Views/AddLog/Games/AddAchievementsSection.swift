//
//  AddAchievementsSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/19.
//

import SwiftUI

struct AddAchievementsSection: View {
    @Binding var achievements: [Achievement]
    
    var body: some View {
        Section("Achievements"){
            ForEach($achievements) { $achievement in
                NavigationLink(
                    destination: AddAchievementDetailsView(
                        name: $achievement.name, detail: $achievement.detail, isCompleted: $achievement.isCompleted, date: $achievement.date)){
                    TextField("Name",text: $achievement.name)
                    .frame(maxWidth: 225)
                }
            }
            .onDelete { indexSet in
                achievements.remove(atOffsets: indexSet)
            }
            Button("Add Achievement", systemImage: "plus", action: addAchievement)
        }
    }
    
    func addAchievement(){
        let newAchievement = Achievement(name: "", detail: "", isCompleted: false)
        achievements.append(newAchievement)
    }
}

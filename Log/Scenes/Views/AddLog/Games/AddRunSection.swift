//
//  AddRunSection.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/19.
//

import SwiftUI

struct AddRunSection: View {
    @Binding var runs: [Run]
    let achievementCount: Int
    
    var body: some View {
        Section("Runs"){
            ForEach($runs) { $run in
                NavigationLink(
                    destination: AddRunDetailsView(completedTime: $run.completedTime, mode: $run.mode, achievements: $run.achievements, date: $run.date, totalAchievements: achievementCount)){
                    TextField("Run title",text: $run.mode)
                    .frame(maxWidth: 225)
                }
            }
            .onDelete { indexSet in
                runs.remove(atOffsets: indexSet)
            }
            Button("Add Run", systemImage: "plus", action: addRun)
        }
    }
    
    func addRun(){
        let newRun = Run(completedTime: 0, mode: "", achievements: 0, date: Date.now)
        runs.append(newRun)
    }
}

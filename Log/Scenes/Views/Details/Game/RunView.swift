//
//  RunView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/12.
//

import SwiftUI

struct RunView: View {
    var runs: [Run]
    
    var body: some View {
        Text("Runs").font(.headline).foregroundStyle(.gray)
        VStack(alignment: .leading, spacing: 0){
            Divider()
            if runs.count == 0 {
                Text("No runs recorded yet")
                    .padding()
            }else {
                ForEach(runs){ run in
                    HStack{
                        Text(run.mode)
                        Text(run.date, format: .dateTime.year().month().day())
                        Spacer()
                        if run.completedTime != nil {
                            Text(TimeUtils.secondsToHMS(run.completedTime!))
                        }
                    }.padding()
                    Divider()
                }
            }
        }
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


#Preview {
    let game = GameLog(title: "", user: User(username: "", name: "", paternalSurname: ""), gameStudio: "", platform: "")
    let run = Run(completedTime: 3665, mode: "normal", date: Date.now, game: game)
    let run2 = Run(completedTime: 3665, mode: "normal", date: Date.now, game: game)
    let run3 = Run(completedTime: 3665, mode: "normal", date: Date.now, game: game)
    RunView(runs: [run, run2, run3])
    RunView(runs: [])
}

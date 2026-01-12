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
        VStack(alignment: .leading){
            List{
                ForEach(runs){ run in
                    HStack{
                        Text(run.mode)
                        Text(run.date, format: .dateTime.year().month().day())
                        Spacer()
                        if run.completedTime != nil {
                            Text(LogUtils.secondsToTime(run.completedTime!))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let game = GameLog(title: "", user: User(username: "", name: "", paternalSurname: ""), gameStudio: "", platform: "")
    let run = Run(completedTime: 3665, mode: "normal", date: Date.now, game: game)
    RunView(runs: [run])
}

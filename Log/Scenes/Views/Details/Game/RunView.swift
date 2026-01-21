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
                        if run.completedTime != -1.0 {
                            Text(TimeUtils.secondsToHMS(Int(run.completedTime)))
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
    let run = Run(completedTime: 3665, mode: "normal", achievements: 0, date: Date.now)
    let run2 = Run(completedTime: 3665, mode: "normal", achievements: 0, date: Date.now)
    let run3 = Run(completedTime: 3665, mode: "normal", achievements: 0, date: Date.now)
    RunView(runs: [run, run2, run3])
    RunView(runs: [])
}

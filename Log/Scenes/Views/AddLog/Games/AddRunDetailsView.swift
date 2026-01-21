//
//  AddRunDetailsView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/19.
//

import SwiftUI

struct AddRunDetailsView: View {
    @Binding var completedTime: Double
    @Binding var mode: String
    @Binding var achievements: Int
    @Binding var date: Date
    
    let totalAchievements: Int
    var body: some View {
        Form{
            HStack{
                Text("Run time")
                RunTimePicker(duration: $completedTime)
            }
            TextField("Run title", text: $mode)
            HStack{
                Picker("Achievements", selection: $achievements) {
                    ForEach(0..<totalAchievements + 1, id: \.self) { Text("\($0)") }
                }
                .pickerStyle(.automatic)
                Text("/\(totalAchievements)")
            }
            DatePicker("Run date",
                       selection: $date,
                       displayedComponents: [.date, .hourAndMinute])
        }
    }
}


/*
 var completedTime: Int
 var mode: String
 var achievements: Int
 var date: Date
 */

//
//  AddAchievementDetailsView.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/19.
//

import SwiftUI

struct AddAchievementDetailsView: View {
    @Binding var name: String
    @Binding var detail: String
    @Binding var isCompleted: Bool
    @Binding var date: Date
    
    var body: some View {
        Form{
            TextField("Name", text: $name)
            TextField("Description", text: $detail)
            Toggle("Completed", systemImage: isCompleted ? "trophy.fill" : "trophy", isOn: $isCompleted)
            if isCompleted {
                DatePicker("Completed date",
                           selection: $date,
                           in: Date.distantPast...Date.now,
                           displayedComponents: [.date])
            }
        }
    }
}

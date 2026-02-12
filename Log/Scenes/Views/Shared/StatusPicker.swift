//
//  StatusPicker.swift
//  Log
//
//  Created by Diego Herrera on 2026/02/11.
//

import SwiftUI

struct StatusPicker: View {
    @Binding var status: Status
    @Binding var category: LogCategory
    var showTitle: Bool = true
    
    var body: some View {
        Section(showTitle ? "Status" : ""){
            Picker("Status", selection: $status){
                Text(LogUtils.addStatusToText(status: .inQueue, category: category)).tag(Status.inQueue)
                Text(LogUtils.addStatusToText(status: .inProgress, category: category)).tag(Status.inProgress)
                Text("Completed").tag(Status.completed)
                Text("Dropped").tag(Status.dropped)
            }.pickerStyle(.segmented)
        }
    }
}

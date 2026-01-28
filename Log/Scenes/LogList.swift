//
//  LogList.swift
//  Log
//
//  Created by Diego Herrera on 2026/01/08.
//

import SwiftUI
import SwiftData

struct LogList: View {
    @Query(sort: \Log.title) private var logs: [Log]
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    let logService: LogService
    
    @State private var showDeleteConfirmation: Bool = false
    @State private var deletingLog: Log?
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(logs){ log in
                    NavigationLink(value: log){
                        CardView(log: log)
                    }.swipeActions{
                        Button("Delete", systemImage: "trash"){
                            deletingLog = log
                            showDeleteConfirmation = true
                        }.tint(.red)
                    }
                }
            }
            .sheet(item: $deletingLog, content: { log in
                VStack{
                    Spacer()
                    Text("Are you sure you want to delete \(log.title)'s log?")
                        .presentationDetents([.height(120)])
                        .bold()
                    Spacer()
                    Button(action: deleteLog ) {
                        Label("Delete", systemImage: "trash")
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonSizing(.flexible)
                    .font(.title2)
                    .tint(.red)
                    .padding()
                }
            })
            .navigationDestination(for: Log.self){ log in
                LogDetailView(log: log)
            }
        }
    }
    
    func deleteLog() {
        logService.deleteLog(deletingLog!)
    }
}
